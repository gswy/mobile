
import 'package:app/cores/widgets/load_view.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:app/model/conf.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 隐私设置
class ConfSafePage extends GetView<ConfCtrl> {
  const ConfSafePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfCtrl>(
      initState: (_) {
        controller.initSafe();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('隐私设置')
        ),
        body: Obx(() {
          final safe = controller.safe.value;
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ..._auto(context, safe),
                  ..._find(context, safe),
                  ..._bind(context, safe),
                ],
              );
            },
          );
        }),
      ),
    );
  }

  /// 自动添加
  List<Widget> _auto(BuildContext context, ConfSafe? safe) {
    return [
      Text(' 添加我时验证'),
      Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
        child: ListTile(
          title: Text('验证方式'),
          trailing: PopupMenuButton<int>(
            onSelected: (value) {
              safe!.auto = value;
              controller.saveSafe();
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: -1, child: Text("禁止添加")),
              PopupMenuItem(value: 0, child: Text("需要审核")),
              PopupMenuItem(value: 1, child: Text("自动添加")),
            ],
            child: TextButton(
              onPressed: null,
              child: Text(controller.autoName),
            ),
          ),
        ),
      ),
    ];
  }

  /// 查找设置
  List<Widget> _find(BuildContext context, ConfSafe? safe) {
    return [
      Text(' 查找我的方式'),
      Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('编号查找'),
              value: safe!.find.id,
              onChanged: (value) {
                safe.find.id = value;
                controller.safe.refresh();
                controller.saveSafe();
              },
            ),
            SwitchListTile(
              title: Text('邮箱查找'),
              value: safe.find.email,
              onChanged: (value) {
                safe.find.email = value;
                controller.safe.refresh();
                controller.saveSafe();
              },
            ),
            SwitchListTile(
              title: Text('手机查找'),
              value: safe.find.phone,
              onChanged: (value) {
                safe.find.phone = value;
                controller.safe.refresh();
                controller.saveSafe();
              },
            ),
            SwitchListTile(
              title: Text('账号查找'),
              value: safe.find.username,
              onChanged: (value) {
                safe.find.username = value;
                controller.safe.refresh();
                controller.saveSafe();
              },
            ),
            SwitchListTile(
              title: Text('昵称查找'),
              value: safe.find.nickname,
              onChanged: (value) {
                safe.find.nickname = value;
                controller.safe.refresh();
                controller.saveSafe();
              },
            ),
          ],
        ),
      ),
    ];
  }

  /// 绑定设置
  List<Widget> _bind(BuildContext context, ConfSafe? safe) {
    return [
      Text(' 添加我的方式'),
      Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 14),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('名片添加'),
              value: safe!.bind.card,
              onChanged: (value) {
                safe.bind.card = value;
                controller.safe.refresh();
              },
            ),
            SwitchListTile(
              title: Text('扫码添加'),
              value: safe.bind.code,
              onChanged: (value) {
                safe.bind.code = value;
                controller.safe.refresh();
              },
            ),
            SwitchListTile(
              title: Text('群组添加'),
              value: safe.bind.team,
              onChanged: (value) {
                safe.bind.team = value;
                controller.safe.refresh();
                controller.saveSafe();
              },
            ),
          ],
        ),
      ),
    ];
  }

}
