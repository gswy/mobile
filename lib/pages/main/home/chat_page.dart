import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/chat_util.dart';
import 'package:app/cores/utils/date_util.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/ctrls/main/chat_ctrl.dart';
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
        title: Text('聊天'),
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
      body: RefreshIndicator(
        onRefresh: () async {
          controller.loadChatPage(refresh: true);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _search(context)),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _chatItem(context, index),
                  childCount: controller.chatList.length,
                ),
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
      padding: EdgeInsets.only(left: 14, right: 14, top: 16, bottom: 8),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14),
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
    final errBG = Theme.of(context).colorScheme.errorContainer;
    return Obx(() {
      final chat = controller.chatList[index];
      return Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text(chat.title.substring(0, 1))),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chat.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateUtil.readTime(chat.messageAt),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chat.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (chat.unread > 0)
                      Badge(
                        smallSize: 10,
                        largeSize: 10,
                        label: Text(
                          '${chat.unread}',
                          style: const TextStyle(fontSize: 8.6),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            onTap: () {
              final sn = ChatUtil.getSN(BaseAuth.id!, chat.targetId);
              Get.toNamed(
                MainRoute.room,
                arguments: {
                  'sn': sn,
                  'type': chat.type,
                  'title': chat.title,
                  'targetId': chat.targetId,
                },
              );
            },
            // 可选：让两行更紧凑
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            titleAlignment: ListTileTitleAlignment.center,
          ),
          if (index < controller.chatList.length - 1)
            Divider(height: 0.1, thickness: 0.1),
        ],
      );
    });
  }
}
