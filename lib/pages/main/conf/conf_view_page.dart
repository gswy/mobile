import 'package:app/bases/base_main.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/utils/them_util.dart';
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
        title: Text('外观设置'),
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: [
          Card(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            child: Obx(() {
              return Column(
                children: [
                  SwitchListTile(
                    title: Text('自动切换'),
                    value: BaseMain.themeMode.value == ThemeMode.system,
                    onChanged: (value) {
                      ThemUtil.setAuto(value);
                    },
                  ),
                  if (BaseMain.themeMode.value != ThemeMode.system) ...[
                    Divider(thickness: 0.2),
                    ListTile(
                      title: Text('手动切换'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          ThemUtil.setMode(value);
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: "light", child: Text("浅色模式")),
                          PopupMenuItem(value: "night", child: Text("深色模式")),
                        ],
                        child: TextButton(
                          onPressed: null,
                          child: Text(
                            BaseMain.themeMode.value == ThemeMode.light
                                ? '浅色模式'
                                : '深色模式',
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
