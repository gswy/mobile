import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/bind_ctrl.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 新的朋友/群组通知
class UserListPage extends GetView<BindCtrl> {
  const UserListPage({super.key});

  /// 页面渲染
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BindCtrl>(
      initState: (_) {
        controller.initUserList();
      },
      builder: (_) => Obx(
        () => Scaffold(
          appBar: AppBar(title: Text('好友申请')),
          body: LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView.builder(
                padding: EdgeInsets.all(14),
                itemBuilder: (context, index) {
                  return _user(context, index);
                },
                itemCount: controller.userList.length,
              );
            },
          ),
        ),
      ),
    );
  }

  /// 用户信息
  Widget _user(BuildContext context, int key) {
    final user = controller.userList[key];
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
      child: ListTile(
        leading: CircleAvatar(),
        title: Text(user.nickname),
        subtitle: Text(
          user.remark,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        trailing: SizedBox(
          height: 32,
          child: OutlinedButton(
            onPressed: () {
              Get.toNamed(MainRoute.bindUserHand, arguments: {'id': user.id});
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
