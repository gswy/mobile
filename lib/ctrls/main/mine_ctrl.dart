
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 我的页面
class MineCtrl extends BaseCtrl {

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
          title: '外观设置',
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