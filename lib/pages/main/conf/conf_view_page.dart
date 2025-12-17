import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 主题设置
class ConfViewPage extends GetView<ConfCtrl> {
  const ConfViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主题设置'),
        actions: [IconButton(onPressed: () {}, icon: Icon(IconUtil.commSave))],
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [
          Card(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SwitchListTile(
                  title: Text('深色模式'),
                  value: true,
                  onChanged: (value) {},
                ),
                Divider(thickness: 0.2),
                ListTile(
                  title: Text('手动切换'),
                  trailing: TextButton(onPressed: () {}, child: Text('深色模式')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
