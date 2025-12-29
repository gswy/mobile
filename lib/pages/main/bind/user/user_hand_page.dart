import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/bind_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 处理审核
class UserHandPage extends GetView<BindCtrl> {
  const UserHandPage({super.key});

  /// 审核渲染
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BindCtrl>(
      initState: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.loadBindUser();
        });
      },
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('好友审核')),
        body: Obx(
          () => LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView(
                padding: EdgeInsets.all(14),
                children: [_user(context), _mark(context), _hand(context)],
              );
            },
          ),
        ),
      ),
    );
  }

  /// 用户信息
  Widget _user(BuildContext context) {
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
                    '昵称：${controller.user.value == null ? '' : controller.user.value!.nickname}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '账号：${controller.user.value == null ? '' : controller.user.value!.username}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 申请信息
  Widget _mark(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        Text('申请信息', style: TextStyle(fontSize: 12)),
        Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 32),
          child: Container(
            padding: EdgeInsets.all(14),
            child: Text(
              controller.user.value == null
                  ? ''
                  : controller.user.value!.remark,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  /// 操作按钮
  Widget _hand(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            OutlinedButton(
              onPressed: controller.userAccess,
              style: OutlinedButton.styleFrom(
                foregroundColor: scheme.error,
                side: BorderSide(color: scheme.error),
              ),
              child: Text('申请拒绝'),
            ),
            OutlinedButton(onPressed: controller.userAccess, child: Text('申请通过')),
          ],
        ),
        OutlinedButton(
          onPressed: controller.userIgnore,
          style: OutlinedButton.styleFrom(
            foregroundColor: scheme.error,
            side: BorderSide(color: scheme.error),
          ),
          child: Text('忽略申请'),
        ),
      ],
    );
  }
}
