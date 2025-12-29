import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/views/button.dart';
import 'package:app/cores/views/base_input.dart';
import 'package:app/cores/views/base_logo.dart';
import 'package:app/ctrls/base/sign_ctrl.dart';
import 'package:app/route/base/base_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 登录页面
class SigninPage extends BaseView<SignCtrl> {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          children: [
            SizedBox(height: Get.height / 8),
            BaseLogo(),
            SizedBox(height: 30),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.offNamed(BaseRoute.host);
                  },
                  icon: Icon(IconUtil.left, size: 22),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                Expanded(
                  child: Obx(
                    () => Text(
                      "已连接：${controller.host.value}",
                      style: TextStyle(fontSize: 14, color: color.secondary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Obx(
              () => BaseInput(
                controller: controller.username,
                hint: '请输入账号',
                enabled: !controller.loading.value,
                prefix: Icon(IconUtil.user),
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => BaseInput(
                controller: controller.password,
                hint: '请输入密码',
                enabled: !controller.loading.value,
                obscure: true,
                prefix: Icon(IconUtil.pass),
              ),
            ),
            SizedBox(height: 48),
            Obx(
              () => Button(
                name: '登录',
                onPressed: controller.loading.value ? null : controller.signIn,
                loading: controller.loading.value,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed(BaseRoute.signup);
                  },
                  child: Text('注册'),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(BaseRoute.forget);
                  },
                  child: Text('忘记密码？'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
