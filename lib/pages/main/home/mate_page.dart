import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/dicts/bind_dict.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/route/main/main_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 通讯录页面
class MatePage extends BaseView<HomeCtrl> {
  const MatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通讯录"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(MainRoute.find);
            },
            icon: Icon(IconUtil.userPlus, size: 20),
            tooltip: "添加朋友",
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        children: [_find(context), _menu(context), _mate(context)],
      ),
    );
  }

  /// 搜索（点击跳转到搜索页）
  Widget _find(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        // 可以跳转到搜索好友页面
        Get.toNamed(MainRoute.find);
      },
      child: Container(
        height: 48,
        margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: color.surfaceContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 20,
              color: color.onSurfaceVariant.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 6),
            Text(
              '搜索好友',
              style: TextStyle(
                fontSize: 16,
                color: color.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 菜单
  Widget _menu(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 20),
      child: Obx(() {
        return Column(
          children: [
            for (int i = 0; i < controller.mateMenu.length; i++) ...[
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                leading: controller.mateMenu[i].num > 0
                    ? Badge(
                        label: Text('${controller.mateMenu[i].num.value}'),
                        child: CircleAvatar(
                          child: Icon(controller.mateMenu[i].icon, size: 16),
                        ),
                      )
                    : CircleAvatar(
                        child: Icon(controller.mateMenu[i].icon, size: 16),
                      ),
                title: Text(controller.mateMenu[i].name),
                trailing: Icon(IconUtil.commView, size: 20),
                onTap: () {
                  Get.toNamed(controller.mateMenu[i].route);
                },
              ),
              if (i != controller.mateMenu.length - 1)
                Divider(thickness: 0.3, height: 0.3),
            ],
          ],
        );
      }),
    );
  }

  /// 好友分组
  Widget _mate(BuildContext context) {
    return Obx(
      () => Column(
        children: controller.mateList
            .map(
              (it) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(' ${it.index}'),
                  Card(
                    elevation: 0,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 14,
                    ),
                    child: Column(
                      children: [
                        for (var i = 0; i < it.lists.length; i++) ...[
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            leading: CircleAvatar(
                              child: Text(it.lists[i].nickname.characters.first),
                            ),
                            title: Text(it.lists[i].nickname),
                            onTap: () {
                              Get.toNamed(
                                MainRoute.infoMate,
                                arguments: {'id': it.lists[i].id},
                              );
                            },
                          ),
                          if (i != it.lists.length - 1)
                            Divider(thickness: 0.3, height: 0.3),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
