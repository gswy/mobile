import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 账号管理
class ConfAuthPage extends GetView<ConfCtrl> {
  const ConfAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('账号管理')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(onPressed: controller.signExit, child: Text('退出登录')),
          SizedBox(height: 14),
          ElevatedButton(onPressed: controller.hostExit, child: Text('切换服务')),
        ],
      ),
    );
  }
}
