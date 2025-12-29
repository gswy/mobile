
import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/info_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 好友详情
class TeamInfoPage extends GetView<InfoCtrl> {

  const TeamInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoCtrl>(
      initState: (_) {
        controller.initInfoTeam();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('群组详情'),
        ),
        body: Obx(() {
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                children: [
                  _team(context),
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
  Widget _team(BuildContext context) {
    return Obx(() {
      final team = controller.team.value;
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
                      team == null ? '' : team.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'ID：${team == null ? '' : team.id}',
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
    final team = controller.team.value;
    if (team!.isJoined) {
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
          ElevatedButton(onPressed: controller.handBind, child: Text('加入群组'))
        ],
      );
    }
  }

}

