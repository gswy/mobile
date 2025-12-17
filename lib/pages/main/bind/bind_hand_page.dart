import 'package:app/ctrls/main/bind_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindHandPage extends GetView<BindCtrl> {
  const BindHandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('好友审核')),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [_user(context), _mark(context), _hand(context)],
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

  /// 申请信息
  Widget _mark(BuildContext context) {
    return Obx(() {
      final mate = controller.mate.value;
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
                mate == null ? '' : mate.remark,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );
    });
  }

  /// 操作按钮
  Widget _hand(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: OutlinedButton(
              onPressed: controller.reject,
              style: OutlinedButton.styleFrom(
                foregroundColor: scheme.error,
                side: BorderSide(color: scheme.error),
              ),
              child: Text('申请拒绝'),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 44,
            child: OutlinedButton(
              onPressed: controller.submit,
              child: Text('申请通过'),
            ),
          ),
        ),
      ],
    );
  }
}
