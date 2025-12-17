import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/bases/base_serv.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/datas/hive/entity/chat.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/datas/hive/mapper/chat_hive.dart';
import 'package:app/pages/main/home/chat_page.dart';
import 'package:app/pages/main/home/mate_page.dart';
import 'package:app/pages/main/home/mine_page.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 控制
class HomeCtrl extends BaseCtrl {
  /// 消息通知
  final _serv = Get.find<BaseServ>();

  /// 选中导航
  final index = 0.obs;

  /// 导航列表
  final pages = [
    Menu(
      name: '聊天',
      line: IconUtil.chat,
      full: IconUtil.chatFull,
      page: ChatPage(),
    ),
    Menu(
      name: '通讯录',
      line: IconUtil.mate,
      full: IconUtil.mateFull,
      page: MatePage(),
    ),
    Menu(
      name: '我的',
      line: IconUtil.mine,
      full: IconUtil.mineFull,
      page: MinePage(),
    ),
  ].obs;

  /// 获取页面
  Widget get page {
    return pages[index.value].page;
  }

  /// 选中操作
  void select(int i) {
    index.value = i;
  }

  /// 初始化
  @override
  void onInit() {
    super.onInit();
  }

  ///

  /// 持久数据
  final _hive = Get.find<ChatHive>();

  /// 连接状态
  final _conn = Get.find<BaseConn>();

  /// 是否加载
  RxBool get loading => _conn.loading;

  /// 是否连接
  RxBool get connect => _conn.connect;

  /// 会话列表
  List<Chat> get list => _hive.chats;

  /// 用户列表：A -> [MateList...]
  final mates = <String, List<Mate>>{}.obs;

  /// 索引列表（按字母排序，# 放最后）
  List<String> get keys {
    final keys = mates.keys.toList();
    keys.sort((a, b) {
      if (a == '#') return 1;
      if (b == '#') return -1;
      return a.compareTo(b);
    });
    return keys;
  }

  /// 页面滚动
  final scroll = ScrollController();

  /// 加载好友
  Future<void> loadMate() async {
    // loading.value = true;
    // try {
    //   final data = await _serv.getMates();
    //   mates
    //     ..clear()
    //     ..addAll(data);
    //   Get.log('加载好友信息: $mates');
    // } catch (e, s) {
    //   Get.log('加载好友失败: $e\n$s');
    // } finally {
    //   loading.value = false;
    // }
  }

  @override
  void onClose() {
    scroll.dispose();
    super.onClose();
  }

  /// 我的页面>菜单列表
  final menus = <MineMenu>[
    MineMenu(
      title: '账户',
      items: [
        MenuItem(
          icon: IconUtil.confMine,
          title: '账户设置',
          onTap: () {
            Get.toNamed(MainRoute.confMine);
          },
        ),
        MenuItem(
          icon: IconUtil.confLike,
          title: '我的收藏',
          onTap: () {
            Get.toNamed(MainRoute.confLike);
          },
        ),
      ],
    ),
    MineMenu(
      title: '界面',
      items: [
        MenuItem(
          icon: IconUtil.confView,
          title: '主题设置',
          onTap: () {
            Get.toNamed(MainRoute.confView);
          },
        ),
        MenuItem(
          icon: IconUtil.confLang,
          title: '语言设置',
          onTap: () {
            Get.toNamed(MainRoute.confLang);
          },
        ),
        MenuItem(
          icon: IconUtil.confNews,
          title: '通知管理',
          onTap: () {
            Get.toNamed(MainRoute.confNews);
          },
        ),
      ],
    ),
    MineMenu(
      title: '安全',
      items: [
        MenuItem(
          icon: IconUtil.confSafe,
          title: '隐私设置',
          onTap: () {
            Get.toNamed(MainRoute.confSafe);
          },
        ),
        MenuItem(
          icon: IconUtil.confDesk,
          title: '登录设备',
          onTap: () {
            Get.toNamed(MainRoute.confDesk);
          },
        ),
        MenuItem(
          icon: IconUtil.confAuth,
          title: '账号管理',
          onTap: () {
            Get.toNamed(MainRoute.confAuth);
          },
        ),
      ],
    ),
  ].obs;
}

/// 底部菜单
class Menu {
  final String name;
  final IconData line;
  final IconData full;
  final Widget page;

  Menu({
    required this.name,
    required this.line,
    required this.full,
    required this.page,
  });
}

/// 菜单分组
class MineMenu {
  final String title;
  final List<MenuItem> items;

  MineMenu({required this.title, required this.items});
}

/// 菜单项
class MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  MenuItem({required this.icon, required this.title, required this.onTap});
}
