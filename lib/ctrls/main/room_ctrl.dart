
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/model/chat.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 房间数据
class RoomCtrl extends BaseCtrl {

  /// 房间标题
  final title = ''.obs;

  /// 响应聊天
  List<InfoList> get infoList => _infoList();

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

  @override
  void onInit() {
    final args = Get.arguments;
    super.onInit();
  }

  /// 初始化聊天列表
  Future<void> _init() async {

  }

  /// 发送文字消息
  Future<void> sendText(String text) async {

  }

  /// 撤回消息

  /// 过滤数据
  List<InfoList> _infoList() {
    return [];
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
