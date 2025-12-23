
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/team_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 群组列表
class TeamPage extends GetView<TeamCtrl> {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的群组'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(IconUtil.plus))
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}