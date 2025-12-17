import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 语言设置
class ConfLangPage extends GetView<ConfCtrl> {
  const ConfLangPage({super.key});

  /// 渲染页面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('语言设置'),
        actions: [
          IconButton(
            onPressed: () {
              controller.saveSafe();
            },
            icon: Icon(IconUtil.commSave),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [_auto(context), _list(context)],
      ),
    );
  }

  /// 自动切换
  Widget _auto(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
      child: Obx(() => SwitchListTile(
        title: Text('自动切换'),
        value: controller.langAuto.value,
        onChanged: (bool value) {
          controller.swapLangAuto(value);
        },
      )),
    );
  }

  /// 语言列表
  Widget _list(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
      child: Column(
        children: [
          for (var i = 0; i < controller.langList.length; i++) ...[
            Obx(
              () => ListTile(
                title: Text(controller.langList[i].title),
                trailing: controller.lang.value == controller.langList[i].value
                    ? Icon(IconUtil.commCheck)
                    : null,
                onTap: () {
                  controller.swapLang(controller.langList[i].value);
                },
              ),
            ),
            if (i != controller.langList.length - 1)
              const Divider(height: 0.4, thickness: 0.4),
          ],
        ],
      ),
    );
  }
}
