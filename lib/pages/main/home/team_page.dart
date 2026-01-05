import 'package:app/cores/views/avatar.dart';
import 'package:app/ctrls/main/team_ctrl.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 创建群聊
class TeamPage extends GetView<TeamCtrl> {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamCtrl>(
      initState: (_) {
        controller.loadTeamPage(refresh: true);
      },
      builder: (_) => Obx(
        () => Scaffold(
          appBar: AppBar(title: Text('我的群聊')),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.loadTeamPage(refresh: true);
            },
            child: ListView.separated(
              padding: EdgeInsets.all(14),
              itemBuilder: _item,
              separatorBuilder: _line,
              itemCount: controller.teamList.length,
            ),
          ),
        ),
      ),
    );
  }

  /// 分割
  Widget _line(BuildContext context, int index) {
    return Divider(thickness: 0.2, height: 0.2);
  }

  /// 选择子项
  Widget _item(BuildContext context, int index) {
    return Obx(() {
      final team = controller.teamList[index];
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Avatar(
          size: 42,
          textSize: 16,
          url: team.avatar,
          name: team.name,
        ),
        title: Text(team.name),
        onTap: () {
          Get.toNamed(MainRoute.teamInfo, arguments: {'id': team.id});
        },
      );
    });
  }
}
