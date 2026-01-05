import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/cores/utils/file_util.dart';
import 'package:app/datas/http/apis/chat_apis.dart';
import 'package:app/datas/http/apis/file_apis.dart';
import 'package:app/datas/http/resp/file/file_resp.dart';
import 'package:app/model/info.dart';
import 'package:app/cores/utils/uuid_util.dart';
import 'package:app/datas/http/apis/info_apis.dart';
import 'package:app/route/main/main_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

/// 聊天数据
class RoomCtrl extends BaseCtrl {

  /// 会话标识
  String sn = '';

  /// 会话类型
  ChatType type = ChatType.mate;

  /// 会话名称
  String title = '';

  /// 会话对方
  int targetId = 0;

  /// 响应聊天
  final infoList = <Info>[].obs;

  /// 是否显示键盘输入
  final showTextMode = true.obs;

  /// 是否显示表情输入
  final showFaceMode = false.obs;

  /// 是否显示菜单选择
  final showMoreMenu = false.obs;

  /// 列表控制器
  final listCtrl = ScrollController();

  /// 输入控制器
  final textNode = FocusNode();
  final textCtrl = TextEditingController();

  /// 媒体选择器
  final picker = ImagePicker();

  /// 录音相关
  final _voice = AudioRecorder();
  final recording = false.obs;
  final seconds = 0.obs;

  /// 是否松开取消（上滑/滑出）
  final cancelOnRelease = false.obs;

  /// 可选：最短录音秒数（太短就丢弃）
  final int minSeconds = 1;

  /// 可选：最长录音秒数（到点自动结束）
  final int maxSeconds = 60;

  Timer? _timer;
  String? _path;

  /// 录音起始时间戳（用于更准确算时长）
  int _startAtMs = 0;

  /// 保护：防止重复 stop
  bool _stopping = false;

  /// 消息
  @override
  void onInit() {
    /// 接收参数
    final args = Get.arguments as Map<String, dynamic>;
    sn = args['sn'];
    type = args['type'];
    title = args['title'];
    targetId = args['targetId'];
    /// 设置已读：本地
    DB.dao.readChat(sn);
    /// 设置已读：远程
    ChatApis.readChat(sn);
    /// 监听数据变化
    DB.dao.listInfo(sn).listen((data) {
      infoList.assignAll(data);
    });
    /// 加载聊天
    loadInfoList();
    super.onInit();
  }

  /// 加载聊天数据
  Future<void> loadInfoList() async {
    final res = await InfoApis.getInfoList(sn: sn);
    if (res != null) {
      DB.dao.saveInfoList(res.data);
    }
  }

  /// 发送文字消息
  Future<void> sendText(String message) async {
    if (message.trim().isEmpty) return;
    textCtrl.clear();
    /// 构造发送信息
    final clientId = UuidUtil.id;
    final messageAt = DateTime.now().millisecondsSinceEpoch;
    /// 先存储到本地库中
    final info = Info(
      sn: sn,
      type: InfoType.text,
      userId: BaseAuth.id!,
      clientId: clientId,
      avatar: BaseAuth.avatar,
      nickname: BaseAuth.nickname!,
      unread: true,
      status: 0,
      message: message,
      messageAt: messageAt,
    );
    DB.dao.saveInfo(info);
    /// 开始云端发送消息
    final res = await InfoApis.send(
      chat: type.code,
      info: InfoType.text.code,
      clientId: clientId,
      targetId: targetId,
      message: message,
      messageAt: messageAt,
    );
    if (res != null) {
      info.id = res.id;
      info.status = 1;
    } else {
      info.status = -1;
    }
    /// 保存发送状态
    DB.dao.saveInfo(info);
  }

  /// 更多信息
  Future<void> more() async {
    if (type.code == 0) {
      Get.toNamed(MainRoute.userInfo, arguments: {'id': targetId});
    } else {
      Get.toNamed(MainRoute.teamInfo, arguments: {'id': targetId});
    }
  }

  /// 切换显示/隐藏九宫格菜单
  void toggleMoreMenu() {
    showMoreMenu.value = !showMoreMenu.value;
    if (showMoreMenu.value) {
      // 隐藏键盘
      FocusScope.of(Get.context!).unfocus();
    }
  }

  /// 隐藏九宫格菜单
  void hideMoreMenu() {
    FocusScope.of(Get.context!).unfocus();
    showFaceMode.value = false;
    showMoreMenu.value = false;
  }

  /// 切换语音/键盘模式
  Future<void> onTextTap() async {
    if (showTextMode.value) {
      // 现在是键盘 -> 准备切语音
      FocusScope.of(Get.context!).unfocus();
      final ok = await _ensureMicPermission();
      if (ok) {
        showTextMode.value = false;
      }
    } else {
      // 现在是语音 -> 切回键盘
      showTextMode.value = true;
      textNode.requestFocus();
    }

    showFaceMode.value = false;
    showMoreMenu.value = false;
  }


  Future<bool> _ensureMicPermission() async {
    var status = await Permission.microphone.status;
    if (status.isGranted) return true;

    if (status.isPermanentlyDenied) {
      Toast.error('麦克风权限被永久拒绝，请到系统设置开启');
      await openAppSettings();
      return false;
    }

    // 发起请求（会弹框，除非系统不再允许弹）
    status = await Permission.microphone.request();

    if (!status.isGranted) {
      Toast.error('未获得麦克风权限');
      return false;
    }

    return true;
  }



  /// 切换表情
  void onFaceTap() {
    if (showFaceMode.value) {
      FocusScope.of(Get.context!).unfocus();
      showFaceMode.value = false;
    } else {
      FocusScope.of(Get.context!).unfocus();
      showFaceMode.value = true;
    }
    showMoreMenu.value = false;
  }

  /// 写入表情
  void wireFace(String emoji) {
    final text = textCtrl.text;
    final sel = textCtrl.selection;
    if (!sel.isValid) {
      textCtrl.text = text + emoji;
      textCtrl.selection = TextSelection.collapsed(offset: textCtrl.text.length);
      return;
    }
    final start = sel.start;
    final end = sel.end;

    final newText = text.replaceRange(start, end, emoji);
    final newOffset = start + emoji.length;

    textCtrl.value = textCtrl.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newOffset),
      composing: TextRange.empty,
    );
  }

  /// 发送媒体
  Future<void> media(int index) async {
    XFile? file;
    FileResp? resp;
    InfoType infoType = InfoType.image;

    if (index == 0) {
      infoType = InfoType.image;
      file = await picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        final head = await FileUtil.image(file);
        resp = await FileApis.uploadImage(file, head);
      }
    }
    if (index == 1) {
      infoType = InfoType.video;
      file = await picker.pickVideo(source: ImageSource.camera);
      if (file != null) {
        final head = await FileUtil.video(file);
        resp = await FileApis.uploadVideo(file, head);
      }
    }
    if (index == 2) {
      infoType = InfoType.image;
      file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        final head = await FileUtil.image(file);
        resp = await FileApis.uploadImage(file, head);
      }
    }
    if (index == 3) {
      infoType = InfoType.video;
      file = await picker.pickVideo(source: ImageSource.gallery);
      if (file != null) {
        final head = await FileUtil.video(file);
        resp = await FileApis.uploadVideo(file, head);
      }
    }

    if (file == null) return;
    if (resp == null) return;

    /// 构造发送信息
    final clientId = UuidUtil.id;
    final messageAt = DateTime.now().millisecondsSinceEpoch;

    /// 先存储到本地库中
    final info = Info(
      sn: sn,
      type: infoType,
      userId: BaseAuth.id!,
      clientId: clientId,
      avatar: BaseAuth.avatar,
      nickname: BaseAuth.nickname!,
      unread: true,
      status: 0,
      message: jsonEncode(resp),
      messageAt: messageAt,
    );
    DB.dao.saveInfo(info);
    /// 开始云端发送消息
    final res = await InfoApis.send(
      chat: type.code,
      info: infoType.code,
      clientId: clientId,
      targetId: targetId,
      message: jsonEncode(resp),
      messageAt: messageAt,
    );
    if (res != null) {
      info.id = res.id;
      info.status = 1;
    } else {
      info.status = -1;
    }
    /// 保存发送状态
    DB.dao.saveInfo(info);

  }

  /// 录音
  Future<void> voiceStar() async {
    if (recording.value) return;

    // 保险：防止用户没开权限但强行进入语音模式
    final status = await Permission.microphone.status;
    if (!status.isGranted) {
      Toast.error('请先开启麦克风权限');
      return;
    }

    final can = await _voice.hasPermission();
    if (!can) {
      Toast.error('录音组件权限校验失败');
      return;
    }

    _path = await _buildPath();
    await _voice.start(
      const RecordConfig(
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        sampleRate: 44100,
      ),
      path: _path!,
    );

    _startAtMs = DateTime.now().millisecondsSinceEpoch;

    recording.value = true;
    seconds.value = 0;
    cancelOnRelease.value = false;
    _stopping = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds.value++;
    });
  }

  /// 结束录音
  Future<void> voiceStop({bool send = true}) async {
    if (!recording.value) return;
    if (_stopping) return;
    _stopping = true;

    _timer?.cancel();
    _timer = null;

    String? path;
    try {
      path = await _voice.stop();
    } catch (_) {
      // stop 失败也要把状态复位
      path = null;
    }

    recording.value = false;

    final duration = Duration(
      milliseconds: DateTime.now().millisecondsSinceEpoch - _startAtMs,
    ).inSeconds;

    // 录音太短：直接丢弃
    if (duration < minSeconds) {
      await _deleteFile(path ?? _path);
      seconds.value = 0;
      cancelOnRelease.value = false;
      _path = null;
      _stopping = false;
      Toast.error('录音时间太短');
      return;
    }

    // 取消：丢弃
    if (!send) {
      await _deleteFile(path ?? _path);
      seconds.value = 0;
      cancelOnRelease.value = false;
      _path = null;
      _stopping = false;
      return;
    }

    final finalPath = path ?? _path;
    if (finalPath == null) {
      Toast.error('录音失败');
      seconds.value = 0;
      cancelOnRelease.value = false;
      _stopping = false;
      return;
    }

    // 文件存在性检查
    final f = File(finalPath);
    if (!await f.exists() || await f.length() == 0) {
      await _deleteFile(finalPath);
      Toast.error('录音文件无效');
      seconds.value = 0;
      cancelOnRelease.value = false;
      _path = null;
      _stopping = false;
      return;
    }

    await _sendVoice(finalPath, duration);

    // reset
    seconds.value = 0;
    cancelOnRelease.value = false;
    _path = null;
    _stopping = false;
  }

  Future<String> _buildPath() async {
    final dir = await getTemporaryDirectory();
    return '${dir.path}/rec_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

  Future<void> _deleteFile(String? path) async {
    if (path == null) return;
    try {
      final f = File(path);
      if (await f.exists()) await f.delete();
    } catch (_) {}
  }

  Future<void> _sendVoice(String localPath, int duration) async {
    // 1) 上传文件（你需要根据实际接口替换）
    FileResp? resp;

    try {
      resp = await FileApis.uploadVoice(XFile(localPath));
    } catch (e) {
      Toast.error('语音上传失败');
      return;
    }

    if (resp == null) {
      Toast.error('语音上传失败');
      return;
    }

    // 2) 构造消息体：建议包含 url + duration（服务端/客户端解析方便）
    final payload = {
      'path': resp.path,          // 如果 resp 可 jsonEncode
      'duration': duration,
    };

    final clientId = UuidUtil.id;
    final messageAt = DateTime.now().millisecondsSinceEpoch;

    final info = Info(
      sn: sn,
      type: InfoType.voice,
      userId: BaseAuth.id!,
      clientId: clientId,
      avatar: BaseAuth.avatar,
      nickname: BaseAuth.nickname!,
      unread: true,
      status: 0,
      message: jsonEncode(payload),
      messageAt: messageAt,
    );

    DB.dao.saveInfo(info);

    final res = await InfoApis.send(
      chat: type.code,
      info: InfoType.voice.code,
      clientId: clientId,
      targetId: targetId,
      message: jsonEncode(payload),
      messageAt: messageAt,
    );

    if (res != null) {
      info.id = res.id;
      info.status = 1;
    } else {
      info.status = -1;
    }

    DB.dao.saveInfo(info);
  }

  /// 切换更多
  void onMoreTap() {
    FocusScope.of(Get.context!).unfocus();
    showFaceMode.value = !showFaceMode.value;
    showFaceMode.value = false;
    showMoreMenu.value = true;
  }

  @override
  void onClose() {
    textCtrl.dispose();
    super.onClose();
  }
}
