import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 登录设备
class ConfDeskPage extends GetView<ConfCtrl> {
  const ConfDeskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录设备')),
      body: GetBuilder<ConfCtrl>(
        initState: (_) {
          controller.initDesk();
        },
        builder: (_) => ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: _item,
          itemCount: 20,
        ),
      ),
    );
  }

  Widget _item(BuildContext context, int key) {
    return Card(
      elevation: 0,
      child: ListTile(
        title: Text('IPhone'),
        subtitle: Text('李XX的IPhone 16'),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
