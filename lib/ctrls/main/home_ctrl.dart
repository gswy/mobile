
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/pages/main/home/chat_page.dart';
import 'package:app/pages/main/home/mate_page.dart';
import 'package:app/pages/main/home/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 控制
class HomeCtrl extends BaseCtrl {

  /// -------------- 公共底部 ----------------
  /// 选中导航
  final index = 0.obs;

  /// 获取页面
  Widget get page {
    return pages[index.value].page;
  }

  /// 导航列表
  final pages = [
    Menu(
      num: 0,
      name: '聊天',
      line: IconUtil.chat,
      full: IconUtil.chatFull,
      page: ChatPage(),
    ),
    Menu(
      num: 0,
      name: '通讯录',
      line: IconUtil.mate,
      full: IconUtil.mateFull,
      page: MatePage(),
    ),
    Menu(
      num: 0,
      name: '我的',
      line: IconUtil.mine,
      full: IconUtil.mineFull,
      page: MinePage(),
    ),
  ].obs;

  /// 选中操作
  void select(int i) {
    index.value = i;
  }

  /// 初始化操作
  @override
  void onInit() {
    /// 测试
    // DB.test();
    // /// 订阅消息未读数量
    // DB.dao.selectChatUnread(100).listen((num) {
    //   pages[0].num.value = num;
    // });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// -------------- 聊天页面 ----------------

  /// -------------- 通讯页面 ----------------


}

/// 底部菜单
class Menu {
  final RxInt num;
  final String name;
  final IconData line;
  final IconData full;
  final Widget page;

  Menu({
    required int num,
    required this.name,
    required this.line,
    required this.full,
    required this.page,
  }) : num = num.obs;
}



