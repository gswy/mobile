import 'package:app/cores/bases/base_view.dart';
import 'package:app/ctrls/main/home_ctrl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 业务首页
class HomePage extends BaseView<HomeCtrl> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.page,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: controller.select,
          elevation: 8,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          items: [
            for (int i = 0; i < controller.pages.length; i++) ...[
              BottomNavigationBarItem(
                icon: controller.pages[i].num > 0
                    ? Badge(
                        label: Text('${controller.pages[i].num.value}'),
                        child: Icon(controller.pages[i].line, size: 22),
                      )
                    : Icon(controller.pages[i].line, size: 22),
                activeIcon: controller.pages[i].num > 0
                    ? Badge(
                        label: Text('${controller.pages[i].num.value}'),
                        child: Icon(controller.pages[i].full, size: 22),
                      )
                    : Icon(controller.pages[i].full, size: 22),
                label: controller.pages[i].name,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
