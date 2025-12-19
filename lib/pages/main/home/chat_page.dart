import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/chat_ctrl.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/route/comm/comm_route.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatPage extends BaseView<ChatCtrl> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() {
          return Column(children: [
            Text("聊天"),
            if (controller.loading.value) Text('连接中', style: TextStyle(fontSize: 12)),
            if (!controller.connect.value) Text('未连接', style: TextStyle(fontSize: 12)),
          ]);
        }),
        actions: [
          PopupMenuButton(
            icon: Icon(IconUtil.plus),
            onSelected: (route) {
              Get.toNamed(route);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: CommRoute.scan,
                child: Row(
                  children: [
                    Icon(IconUtil.scanCode, size: 14),
                    SizedBox(width: 10),
                    Text("扫码识别"),
                  ],
                ),
              ),
            ],
          ),
        ],
        elevation: 4,
      ),
      body: Obx(
        () => CustomScrollView(
          slivers: [
            // 通栏搜索框（作为滚动内容的一部分）
            SliverToBoxAdapter(child: _search(context)),
            // 聊天列表
            SliverList(
              delegate: SliverChildBuilderDelegate(
                _chatItem,
                childCount: controller.list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 搜索主体
  Widget _search(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(14),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color.surfaceContainer,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconUtil.search,
                size: 16,
                color: color.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              SizedBox(width: 4),
              Text(
                "搜索",
                style: TextStyle(
                  fontSize: 16,
                  color: color.onSurfaceVariant.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 聊天项目
  Widget _chatItem(BuildContext context, int index) {
    return Obx(() {
      final item = controller.list[index];
      final lens = controller.list.length - 1;
      return Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text(item.name.substring(0, 1))),
            title: Text(item.name),
            subtitle: Text(item.content ?? ''),
            trailing: Column(
              children: [Text(''), Text("zzz")],
            ),
            onTap: () {
              Get.toNamed(
                MainRoute.room,
                arguments: {'id': item.id, 'mode': item.mode},
              );
            },
          ),
          if (index < lens)
            Divider(height: 0.1, thickness: 0.1, color: Colors.grey),
        ],
      );
    });
  }
}
