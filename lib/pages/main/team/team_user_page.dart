
import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/team/team_user_ctrl.dart';
import 'package:app/ctrls/main/team_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 好友详情
class TeamUserPage extends GetView<TeamUserCtrl> {
  const TeamUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamCtrl>(
      initState: (_) {
        controller.loadUserPage(refresh: true);
      },
      builder: (_) =>
        Obx(() =>
          Scaffold(
            appBar: AppBar(
              title: Text('群组成员'),
            ),
            body: LoadView(
              loading: controller.loading.value,
              message: controller.message.value,
              builder: (_) {
                return ListView(
                  padding: EdgeInsets.symmetric(
                      vertical: 16, horizontal: 20),
                  children: [],
                );
              },
            ),
          ),
        ),
    );
  }
}
