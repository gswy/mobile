import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 我的收藏
class ConfLikePage extends GetView<ConfCtrl> {
  const ConfLikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfCtrl>(
      initState: (_) {
        controller.initLike();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('我的收藏')),
        body: Obx(() {
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView.builder(
                controller: controller.likeScroll,
                padding: EdgeInsets.all(14),
                itemBuilder: _list,
                itemCount: controller.likeList.length,
              );
            },
          );
        }),
      ),
    );
  }

  Widget _list(BuildContext context, int index) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 0, right: 0, bottom: 14),
      child: Obx(
        () => ListTile(
          minVerticalPadding: 10,
          leading: CircleAvatar(radius: 20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.likeList[index].name),
              Text('2025-12-16 17:49:23', style: TextStyle(fontSize: 12)),
            ],
          ),
          subtitle: Text(controller.likeList[index].body),
        ),
      ),
    );
  }
}
