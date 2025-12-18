import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/route/comm/comm_route.dart';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinePage extends BaseView<HomeCtrl> {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.height / 6;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: height,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Row(
                    spacing: 12,
                    children: [
                      CircleAvatar(radius: 36),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 14,
                              children: [
                                Text(
                                  '${BaseAuth.mine?.nickname}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('账号:${BaseAuth.mine?.username }', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            IconButton(onPressed: () {
                              Get.toNamed(CommRoute.qrcode);
                            }, icon: Icon(IconUtil.commQCode))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              controller.mineMenu.map((it) => _group(it.title, it.items)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 菜单分组
  Widget _group(String label, List<MenuItem> items) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Card(
        margin: const EdgeInsets.only(top: 14),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            for (var i = 0; i < items.length; i++) ...[
              ListTile(
                leading: Icon(items[i].icon, size: 20),
                title: Text(items[i].title),
                onTap: items[i].onTap,
                trailing: Icon(IconUtil.commView, size: 20),
              ),
              if (i != items.length - 1)
                const Divider(height: 0.4, thickness: 0.4),
            ],
          ],
        ),
      ),
    );
  }
}
