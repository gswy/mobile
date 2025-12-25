import 'dart:math';

import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/model/info.dart';
import 'package:app/cores/utils/uuid_util.dart';
import 'package:app/datas/http/apis/info_apis.dart';
import 'package:app/route/main/main_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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

  /// 消息
  @override
  void onInit() {
    /// 接收参数
    final args = Get.arguments as Map<String, dynamic>;
    sn = args['sn'];
    type = args['type'];
    title = args['title'];
    targetId = args['targetId'];

    /// 设置已读
    DB.dao.readChat(sn);
    /// 监听数据变化
    DB.dao.listInfo(sn).listen((data) {
      infoList.assignAll(data);
    });
    super.onInit();
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

  /// 处理菜单项点击
  void onMenuTap(String type) {
    hideMoreMenu();
    switch (type) {
      case 'image':
        // 选择照片
        break;
      case 'camera':
        // 拍摄
        break;
      case 'file':
        // 选择文件
        break;
    }
  }

  /// 切换语音/键盘模式
  void onTextTap() {
    if (showTextMode.value) {
      FocusScope.of(Get.context!).unfocus();
      showTextMode.value = false;
    } else {
      showTextMode.value = true;
      textNode.requestFocus();
    }
    showFaceMode.value = false;
    showMoreMenu.value = false;
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

  Future<void> action(int index) async {
    if (index == 0) {
      final file = await picker.pickImage(source: ImageSource.camera);
    }
    if (index == 1) {
      final file = await picker.pickImage(source: ImageSource.gallery);
    }
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
