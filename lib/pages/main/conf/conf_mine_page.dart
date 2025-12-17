
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 个人信息
class ConfMinePage extends GetView<ConfCtrl> {
  const ConfMinePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(IconUtil.commSave))
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}