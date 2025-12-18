
import 'package:app/ctrls/main/info_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 好友详情
class InfoMatePage extends GetView<InfoCtrl> {
  const InfoMatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情'),),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        children: [
          _user(context),
          _acts(context),
        ],
      ),
    );
  }

  /// 用户信息
  Widget _user(BuildContext context) {
    return Obx(() {
      final mate = controller.mate.value;
      return Card(
        elevation: 0,
        margin: EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            spacing: 14,
            children: [
              CircleAvatar(radius: 36),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      '昵称：${mate == null ? '' : mate.nickname}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '账号：${mate == null ? '' : mate.username}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// 用户操作
  Widget _acts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(onPressed: controller.handRoom, child: Text('发送消息'))
      ],
    );
  }

}

