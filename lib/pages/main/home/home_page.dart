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
          items: controller.pages
            .map(
              (it) => BottomNavigationBarItem(
                icon: Icon(it.icon, size: 22),
                label: it.name,
              ),
            )
            .toList(),
        ),
      ),
    );
  }
}
