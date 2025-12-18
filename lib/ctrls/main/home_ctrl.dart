import 'package:app/cores/bases/base_auth.dart';
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

  @override
  void onInit() {
    super.onInit();

    /// 测试
    Future.delayed(const Duration(seconds: 5), () {
      mateMenu[0].num.value = 3;
    });
    Future.delayed(const Duration(seconds: 10), () {
      mateMenu[1].num.value = 5;
    });

    /// 监听菜单通知变化，变更底部菜单通知
    _mateWorker = everAll(mateMenu.map((e) => e.num).toList(), (_) {
      final num = mateMenu.fold<int>(0, (sum, e) => sum + e.num.value);
      Get.log('消息变化: $num');
      pages[1].num.value = num;
    });
  }

  @override
  void onClose() {
    _mateWorker.dispose();
    super.onClose();
  }

  /// -------------- 聊天页面 ----------------
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

  /// -------------- 通讯页面 ----------------
  /// 事件监听
  late final Worker _mateWorker;
  final mateMenu = <MateMenu>[
    MateMenu(
      num: 0,
      name: '新的朋友',
      icon: IconUtil.usersFull,
      route: MainRoute.bindNews,
    ),
    MateMenu(
      num: 0,
      name: '群组通知',
      icon: IconUtil.bellsFull,
      route: MainRoute.bindNews,
    ),
    MateMenu(
      num: 0,
      name: '我的群组',
      icon: IconUtil.teamsFull,
      route: MainRoute.bindNews,
    ),
  ];

  /// 好友列表
  final mateList = <MateList>[
    MateList(
      index: 'A',
      lists: [
        MateItem(id: 1, nickname: '啊~~'),
        MateItem(id: 1, nickname: '阿萨德'),
      ],
    ),
    MateList(
      index: 'B',
      lists: [
        MateItem(id: 1, nickname: '包拯'),
        MateItem(id: 1, nickname: '摆渡'),
      ],
    ),
    MateList(
      index: 'C',
      lists: [
        MateItem(id: 1, nickname: '蔡瑞'),
        MateItem(id: 1, nickname: '蔡徐坤'),
      ],
    ),
    MateList(
      index: 'D',
      lists: [
        MateItem(id: 1, nickname: '达选安'),
        MateItem(id: 1, nickname: '妲己'),
      ],
    ),
    MateList(
      index: 'L',
      lists: [
        MateItem(id: 1, nickname: '李宗明'),
        MateItem(id: 1, nickname: '李力'),
        MateItem(id: 1, nickname: '李唐'),
      ],
    ),
  ].obs;

  /// -------------- 我的页面 ----------------
  /// 菜单列表
  final mineMenu = <MineMenu>[
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
          icon: IconUtil.confServ,
          title: '服务信息',
          onTap: () {
            Get.toNamed(MainRoute.confServ);
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

/// 通讯好友
class MateList {
  final String index;
  final List<MateItem> lists;

  MateList({required this.index, required this.lists});
}

/// 单个选项
class MateItem {
  final int id;
  final String? avatar;
  final String nickname;
  MateItem({required this.id, this.avatar, required this.nickname});
}

/// 通讯菜单
class MateMenu {
  final RxInt num;
  final String name;
  final IconData icon;
  final String route;

  MateMenu({
    required int num,
    required this.name,
    required this.icon,
    required this.route,
  }) : num = num.obs;
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
