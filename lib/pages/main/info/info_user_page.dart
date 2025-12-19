
import 'package:app/cores/widgets/load_view.dart';
import 'package:app/ctrls/main/info_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 好友详情
class InfoUserPage extends GetView<InfoCtrl> {
  const InfoUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoCtrl>(
      initState: (_) {
        controller.initInfoUser();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('用户详情'),
        ),
        body: Obx(() {
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                children: [
                  _user(context),
                  _acts(context),
                ],
              );
            },
          );
        }),
      ),
    );
  }

  /// 用户信息
  Widget _user(BuildContext context) {
    return Obx(() {
      final user = controller.user.value;
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
                      '昵称：${user == null ? '' : user.nickname}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '账号：${user == null ? '' : user.username}',
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
    final user = controller.user.value;
    if (user!.isFriend) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(onPressed: controller.handRoom, child: Text('发送消息'))
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(onPressed: controller.handBind, child: Text('添加好友'))
        ],
      );
    }
  }

}

