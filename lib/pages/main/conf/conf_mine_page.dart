import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/views/user_logo.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 个人信息
class ConfMinePage extends GetView<ConfCtrl> {
  const ConfMinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人信息')),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            child: Obx(
              () => Column(
                children: [
                  ListTile(
                    title: Text('头像'),
                    trailing: UserLogo(
                      size: 36,
                      url: BaseAuth.avatar,
                      name: BaseAuth.nickname!,
                      onTap: () {
                        controller.avatar();
                      },
                    ),
                  ),
                  Divider(thickness: 0.2, height: 0.2),
                  ListTile(
                    title: Text('标识'),
                    trailing: Text('${BaseAuth.id}'),
                  ),
                  Divider(thickness: 0.2, height: 0.2),
                  ListTile(
                    title: Text('昵称'),
                    trailing: Text('${BaseAuth.nickname}'),
                  ),
                  Divider(thickness: 0.2, height: 0.2),
                  ListTile(
                    title: Text('账号'),
                    trailing: Text('${BaseAuth.username}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
