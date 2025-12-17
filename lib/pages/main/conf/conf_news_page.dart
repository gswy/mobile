
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 消息通知
class ConfNewsPage extends GetView<ConfCtrl> {
  const ConfNewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息通知'),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(IconUtil.commSave))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [

        ],
      ),
    );
  }
}