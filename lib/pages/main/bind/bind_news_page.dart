import 'package:app/ctrls/main/bind_ctrl.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 新的朋友
class BindNewsPage extends GetView<BindCtrl> {
  const BindNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新的朋友')),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.all(14),
          itemBuilder: _user,
          itemCount: controller.list.length,
        );
      }),
    );
  }

  /// 用户信息
  Widget _user(BuildContext context, int key) {
    final it = controller.list[key];
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(it.nickname),
        subtitle: Text(
          it.remark, maxLines: 1, overflow: TextOverflow.ellipsis, softWrap: false,
        ),
        trailing: SizedBox(
          height: 32,
          child: OutlinedButton(
            onPressed: () {
              Get.toNamed(MainRoute.bindHand, arguments: {"id": it.id});
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
            ),
            child: Text('查看'),
          ),
        ),
      ),
    );
  }
}
