
import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/pages/main/home/chat_page.dart';
import 'package:app/pages/main/home/mate_page.dart';
import 'package:app/pages/main/home/mine_page.dart';
import 'package:app/pages/main/home/work_page.dart';
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
      name: '企业',
      line: IconUtil.work,
      full: IconUtil.workFull,
      page: WorkPage(),
    ),
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

  /// 初始化操作
  @override
  void onInit() {
    /// 订阅消息未读数量
    DB.dao.selectChatUnread(BaseAuth.id!).listen((int num) {
      pages[0].num = num;
      pages.refresh();
    });
    super.onInit();
  }

  /// 选中操作
  void select(int i) {
    index.value = i;
  }

  @override
  void onClose() {
    super.onClose();
  }


}

/// 底部菜单
class Menu {
  int num;
  String name;
  IconData line;
  IconData full;
  Widget page;

  Menu({
    required this.num,
    required this.name,
    required this.line,
    required this.full,
    required this.page,
  });
}



