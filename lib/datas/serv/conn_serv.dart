import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/dicts/news_dict.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/utils/desk_util.dart';
import 'package:app/cores/utils/host_util.dart';
import 'package:app/cores/utils/sign_util.dart';
import 'package:app/model/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

/// 连接管理
class ConnServ extends BaseCtrl {
  StreamSubscription? _sub;
  IOWebSocketChannel? _channel;

  final message = ''.obs;
  final loading = false.obs;
  final reading = false.obs;

  /// 手动停止：手动 stop 后不再自动重连
  bool _fullStop = false;

  /// 防并发连接
  bool _connecting = false;

  /// 心跳
  Timer? _keepTime;
  DateTime _lastKeep = DateTime.fromMillisecondsSinceEpoch(0);

  /// 重连（注意：这里改成“单次 timer”，不是 periodic）
  Timer? _anewTime;

  /// 重连间隔（你可以改成退避）
  final Duration _retryDelay = const Duration(seconds: 5);

  /// 每次连接尝试的“总超时兜底”
  static const Duration _connectOverallTimeout = Duration(seconds: 8);

  Future<void> star() async {
    _fullStop = false;
    _startReconnectLoop(immediately: true);
  }

  Future<void> stop() async {
    _fullStop = true;
    await _stopAll();
  }

  @override void onResumed() {
    super.onResumed();
    if (!_fullStop) {
      _startReconnectLoop(immediately: true);
    }
  }

  /// ========== 核心：重连循环（永不停） ==========
  void _startReconnectLoop({bool immediately = false}) {
    if (_fullStop) return;

    // 已连上就停
    if (reading.value && _channel != null) {
      _stopAnew();
      return;
    }

    // 如果已经在跑，就不重复创建 timer；但可以立刻补一次尝试
    if (_anewTime != null) {
      if (immediately) _kickTryConnect();
      return;
    }

    message.value = '连接中';

    void scheduleNext(Duration delay) {
      if (_fullStop) return;
      _anewTime?.cancel();
      _anewTime = Timer(delay, _kickTryConnect);
    }

    void scheduleAfterAttempt() {
      // 不管成功失败，都安排下一次（成功会在 tryConnect 成功里 stopAnew）
      scheduleNext(_retryDelay);
    }

    void kick() async {
      if (_fullStop) return;
      scheduleAfterAttempt();
      await _tryConnectOnce();
      if (reading.value && _channel != null) {
        _stopAnew();
      }
    }
    _kickTryConnect = kick;
    scheduleNext(immediately ? Duration.zero : _retryDelay);
  }

  /// 用一个可替换的回调供 Timer 调用
  late void Function() _kickTryConnect;

  /// 单次尝试连接：保证“可结束”，不允许无限挂起
  Future<void> _tryConnectOnce() async {
    if (_fullStop) return;
    if (_connecting) return;

    // 已连接直接返回
    if (reading.value && _channel != null) return;

    _connecting = true;
    loading.value = true;

    final url = HostUtil.getWS();
    final token = SignUtil.getToken();

    if (url.isEmpty || token.isEmpty) {
      message.value = '连接错误';
      reading.value = false;
      loading.value = false;
      _connecting = false;
      return;
    }

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $token',
      'id': DeskUtil.id,
      'name': DeskUtil.name,
      'info': DeskUtil.info,
    };

    try {
      // 每次尝试前，彻底清理旧资源（避免残留导致假死）
      await _stopCore(stopKeep: true);

      message.value = '连接中';

      // ✅ 总超时兜底：任何异常/卡住，最多 _connectOverallTimeout 就会返回
      await Future(() async {
        _channel = IOWebSocketChannel.connect(
          url,
          headers: headers,
          // 如果你走业务 "PING/PONG" 心跳，这里建议不要再开协议层 pingInterval
          // pingInterval: const Duration(seconds: 10),
          connectTimeout: const Duration(seconds: 5),
        );

        await _channel!.ready.timeout(const Duration(seconds: 5));

        _sub = _channel!.stream.listen(
          _onData,
          onDone: _onDone,
          onError: _onFail,
          cancelOnError: true,
        );
      }).timeout(_connectOverallTimeout);

      // ✅ 成功
      reading.value = true;
      message.value = '';
      _lastKeep = DateTime.now();
      _startKeep();

      Get.log('[WS] 连接成功');
    } catch (e) {
      // ✅ 失败也要“快速结束并释放”，下一轮还会再试
      Get.log('[WS] 连接失败: $e');
      reading.value = false;
      message.value = '连接中'; // 你想一直显示连接中，就保持这个
      await _stopCore(stopKeep: true);
    } finally {
      loading.value = false;
      _connecting = false;
    }
  }

  /// ========== 清理 ==========
  Future<void> _stopCore({required bool stopKeep}) async {
    if (stopKeep) _stopKeep();

    // 取消订阅：一般不会卡，但也不强求
    try {
      await _sub?.cancel().timeout(const Duration(seconds: 1));
    } catch (_) {}
    _sub = null;

    // close：最容易卡住，绝对不要无限 await
    final ch = _channel;
    _channel = null;

    try {
      // 不要让它阻塞重连链路
      await ch?.sink.close(WebSocketStatus.normalClosure, '')
          .timeout(const Duration(seconds: 1));
    } catch (_) {}
  }

  Future<void> _stopAll() async {
    _stopAnew();
    _stopKeep();
    reading.value = false;
    loading.value = false;
    message.value = '';
    await _stopCore(stopKeep: false);
    Get.log('[WS] 已手动停止');
  }

  void _stopAnew() {
    _anewTime?.cancel();
    _anewTime = null;
    Get.log('[WS] 停止重连');
  }

  /// ========== 心跳（业务层 PING/PONG） ==========
  void _startKeep() {
    _keepTime?.cancel();
    Get.log('[WS] 开启心跳');

    _keepTime = Timer.periodic(const Duration(seconds: 10), (_) async {
      if (_channel == null) return;

      final space = DateTime.now().difference(_lastKeep);
      if (space > const Duration(seconds: 30)) {
        Get.log('[WS] 心跳超时(${space.inSeconds}s)，触发重连');
        reading.value = false;
        await _stopCore(stopKeep: true);

        // ✅ 非手动 stop => 保证重连循环在跑
        if (!_fullStop) _startReconnectLoop(immediately: true);
        return;
      }

      try {
        _channel!.sink.add('PING');
      } catch (e) {
        Get.log('[WS] 心跳发送失败: $e');
        reading.value = false;
        await _stopCore(stopKeep: true);
        if (!_fullStop) _startReconnectLoop(immediately: true);
      }
    });
  }

  void _stopKeep() {
    _keepTime?.cancel();
    _keepTime = null;
    Get.log('[WS] 停止心跳');
  }

  Future<void> _onData(dynamic data) async {
    if (data is! String) return;

    if (data == 'PONG') {
      _lastKeep = DateTime.now();
      return;
    }

    try {
      final res = jsonDecode(data);
      Get.log('[WS] 收到消息: $res');
      if (res['type'] == NewsDict.chatInfoBody) {
        final info = Info.fromJson(res['payload']);
        DB.dao.saveInfo(info);
        final chat = await DB.dao.findChat(info.sn);
        Get.log('[WS] 收到消息: 聊天数据ID: ${chat?.id}');
        if (chat != null) {
          chat.message = info.message;
          chat.messageAt = info.messageAt;
          chat.unread = chat.unread + 1;
          await DB.dao.saveChat(chat);
        }
      }
    } catch (e) {
      Get.log('[WS] 消息处理: $e');
    }
  }

  Future<void> _onFail(Object e, [StackTrace? st]) async {
    Get.log('[WS] onError: $e');
    reading.value = false;
    await _stopCore(stopKeep: true);
    if (!_fullStop) _startReconnectLoop(immediately: false);
  }

  Future<void> _onDone() async {
    Get.log('[WS] onDone: 连接关闭');
    reading.value = false;
    await _stopCore(stopKeep: true);
    if (!_fullStop) _startReconnectLoop(immediately: false);
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopAnew();
    _stopKeep();
    _stopCore(stopKeep: false);
    super.onClose();
  }
}
