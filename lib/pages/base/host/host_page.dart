import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/widgets/base_button.dart';
import 'package:app/cores/widgets/base_input.dart';
import 'package:app/cores/widgets/base_logo.dart';
import 'package:app/ctrls/base/host_ctrl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 地址页面
class HostPage extends BaseView<HostCtrl> {
  const HostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            SizedBox(height: Get.height / 8),
            BaseLogo(),
            SizedBox(height: 30),
            _host(),
          ],
        ),
      ),
    );
  }

  Widget _host() {
    return Column(
      spacing: 36,
      children: [
        Obx(
          () => BaseInput(
            controller: controller.host,
            hint: '请输入服务地址',
            center: true,
            enabled: !controller.loading.value,
          ),
        ),
        Obx(
          () => BaseButton(
            name: '连接服务',
            onPressed: controller.loading.value ? null : controller.test,
            loading: controller.loading.value,
          ),
        ),
      ],
    );
  }
}
