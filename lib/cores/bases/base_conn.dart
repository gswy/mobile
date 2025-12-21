import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/utils/desk_util.dart';
import 'package:app/cores/utils/sign_util.dart';
import 'package:app/cores/value/host_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

/// 用户连接
class BaseConn extends GetxService with WidgetsBindingObserver {
  IOWebSocketChannel? _client;
  StreamSubscription? _sub;

  final loading = false.obs;
  final connect = false.obs;
  final reading = false.obs;

  bool _enabled = false;
  bool _foreground = true;

  // ---- 重连 ----
  Timer? _reconnectTimer;
  static const Duration _reconnectInterval = Duration(seconds: 5);

  // 防止并发重连尝试
  bool _connecting = false;

  // ---- 心跳 ----
  Timer? _hbTimer;
  static const Duration _hbInterval = Duration(seconds: 10);
  static const Duration _hbTimeout = Duration(seconds: 30);
  DateTime _lastAlive = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    final s = WidgetsBinding.instance.lifecycleState;
    _foreground = (s == AppLifecycleState.resumed);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _foreground = (state == AppLifecycleState.resumed);
    if (!_enabled) return;

    if (state == AppLifecycleState.resumed) {
      star();
    }

    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden) {
      _stopHeartbeat();
      _stopReconnect();
      _closeSocketOnly();
      loading.value = false;
      connect.value = false;
      reading.value = false;
      _connecting = false;
    }
  }

  /// 外部调用：允许连接（启动）
  Future<void> star() async {
    _enabled = true;
    if (!_foreground) return;
    _scheduleReconnect(immediate: true);
  }

  /// 外部调用：彻底停止
  Future<void> stop() async {
    _enabled = false;
    _stopHeartbeat();
    _stopReconnect();
    await _closeSocketOnly();
    loading.value = false;
    connect.value = false;
    reading.value = false;
    _connecting = false;
  }

  // =======================
  // 重连：用“一次性 Timer + 自己再次调度”的方式
  // 避免 Timer.periodic + async 造成的锁死
  // =======================
  void _scheduleReconnect({bool immediate = false}) {
    if (!_enabled || !_foreground) return;

    // 已连接就不重连
    if (connect.value) return;

    // 已经有重连定时器就别重复创建
    if (_reconnectTimer != null) return;

    final delay = immediate ? Duration.zero : _reconnectInterval;

    _reconnectTimer = Timer(delay, () async {
      _reconnectTimer = null; // 这次触发后立刻释放，方便下一次调度

      if (!_enabled || !_foreground) return;
      if (connect.value) return;

      Get.log('[WS] 尝试重连...');
      await _connectOnce();

      // 如果仍未连上，继续下一轮（无上限）
      if (!_enabled || !_foreground) return;
      if (!connect.value) {
        _scheduleReconnect(immediate: false);
      }
    });
  }

  void _stopReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  // =======================
  // 建立一次连接（关键：ready 必须有超时）
  // =======================
  Future<void> _connectOnce() async {
    if (!_enabled || !_foreground) return;
    if (_connecting) return; // 防止并发
    if (connect.value) return;

    _connecting = true;
    loading.value = true;

    final host = LocalStore.getString(HostConstants.hostKey) ?? '';
    final token = SignUtil.getToken();

    if (host.isEmpty || token.isEmpty) {
      loading.value = false;
      _connecting = false;
      return;
    }

    final url = 'wss://$host/ws';
    final headers = <String, dynamic>{
      'Authorization': 'Bearer $token',
      'id': DeskUtil.id,
      'name': DeskUtil.name,
      'info': DeskUtil.info,
    };

    try {
      await _closeSocketOnly();

      _client = IOWebSocketChannel.connect(
        url,
        headers: headers,
        pingInterval: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 5),
      );

      // 握手阶段必须 timeout，否则会卡住导致 loading 永远 true
      await _client!.ready.timeout(const Duration(seconds: 5));

      _sub = _client!.stream.listen(
        _onData,
        onDone: _onDone,
        onError: _onFail,
        cancelOnError: true,
      );

      connect.value = true;
      reading.value = true;
      loading.value = false;
      _connecting = false;

      _lastAlive = DateTime.now();
      _startHeartbeat();

      Get.log('[WS] 建立连接');
    } on TimeoutException catch (_) {
      Get.log('[WS] 建立连接超时（ready timeout）');
      await _closeSocketOnly();
      connect.value = false;
      reading.value = false;
      loading.value = false;
      _connecting = false;
    } catch (e) {
      Get.log('[WS] 建立连接失败: $e');
      await _closeSocketOnly();
      connect.value = false;
      reading.value = false;
      loading.value = false;
      _connecting = false;
    }
  }

  Future<void> _closeSocketOnly() async {
    try {
      await _sub?.cancel();
    } catch (_) {}
    _sub = null;
    try {
      await _client?.sink.close(WebSocketStatus.normalClosure, "close");
    } catch (_) {}
    _client = null;
  }

  // =======================
  // 心跳（PING + 超时断开触发重连）
  // =======================
  void _startHeartbeat() {
    _hbTimer?.cancel();
    _hbTimer = Timer.periodic(_hbInterval, (_) async {
      if (!_enabled || !_foreground) return;
      if (!connect.value || _client == null) return;

      final gap = DateTime.now().difference(_lastAlive);
      if (gap > _hbTimeout) {
        Get.log('[WS] 心跳超时(${gap.inSeconds}s)，断开并重连');
        await _handleDisconnect();
        return;
      }
      try {
        _client!.sink.add("PING");
      } catch (e) {
        Get.log('[WS] PING 发送失败: $e');
        await _handleDisconnect();
      }
    });
  }

  void _stopHeartbeat() {
    _hbTimer?.cancel();
    _hbTimer = null;
  }

  Future<void> _handleDisconnect() async {
    _stopHeartbeat();
    await _closeSocketOnly();

    connect.value = false;
    reading.value = false;
    loading.value = false;
    _connecting = false;

    // ✅ 继续无限重连
    _scheduleReconnect(immediate: false);
  }

  Future<void> _onData(dynamic data) async {
    _lastAlive = DateTime.now();
    if (data is! String) return;

    // 支持服务端 pong
    if (data == 'PONG') {
      // Get.log('心跳检测');
      return;
    }
    try {
      final res = jsonDecode(data);

    } catch (e) {
      return;
    }
  }

  void _onFail(Object e, [StackTrace? st]) async {
    Get.log("[WS] 错误信息: $e");
    if (!_enabled) return;
    await _handleDisconnect();
  }

  void _onDone() async {
    Get.log('[WS] 连接关闭');
    if (!_enabled) return;
    await _handleDisconnect();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopHeartbeat();
    _stopReconnect();
    _closeSocketOnly();
    super.onClose();
  }
}
