import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 服务中心
class ConfServPage extends GetView<ConfCtrl> {
  const ConfServPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfCtrl>(
      initState: (_) {
        controller.initLike();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('服务信息')),
        body: Obx(() {
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: _server,
          );
        }),
      ),
    );
  }

  /// 服务信息
  Widget _server(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(14),
      children: [
        Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Text('服务地址'),
                trailing: Text('test.nextchat.ltd'),
              ),
              Divider(height: 0.4, thickness: 0.4),
              ListTile(
                title: Text('服务名称'),
                trailing: Text('甘肃万云信息技术有限公司'),
              ),
            ],
          ),
        )
      ],
    );
  }


}
