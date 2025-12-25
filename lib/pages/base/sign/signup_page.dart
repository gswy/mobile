import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/widgets/button.dart';
import 'package:app/cores/widgets/base_input.dart';
import 'package:app/cores/widgets/base_logo.dart';
import 'package:app/ctrls/base/sign_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 注册页面
class SignupPage extends BaseView<SignCtrl> {
  const SignupPage({super.key});

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
            Obx(
              () => BaseInput(
                controller: controller.nickname,
                hint: '请输入昵称',
                enabled: !controller.loading.value,
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => BaseInput(
                controller: controller.username,
                hint: '请输入账号',
                enabled: !controller.loading.value,
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => BaseInput(
                controller: controller.password,
                hint: '请输入密码',
                obscure: true,
                enabled: !controller.loading.value,
              ),
            ),
            SizedBox(height: 48),
            Obx(
              () => Button(
                name: '注册',
                onPressed: controller.loading.value ? null : controller.signUp,
                loading: controller.loading.value,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('去登录'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
