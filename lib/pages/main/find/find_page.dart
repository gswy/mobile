import 'package:app/cores/widgets/load_view.dart';
import 'package:app/ctrls/main/find_ctrl.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 搜索页面
class FindPage extends GetView<FindCtrl> {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('添加朋友')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        children: [
          _search(context),
          const SizedBox(height: 16),
          _result(context),
        ],
      ),
    );
  }

  /// 搜索输入
  Widget _search(BuildContext context) {
    final background = Theme.of(context).colorScheme.surfaceContainer;
    final frontColor = Theme.of(
      context,
    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7);
    return Obx(() {
      final hint = controller.hasFocus.value ? null : '输入昵称/账号/邮箱/手机搜索';
      return Container(
        decoration: BoxDecoration(
          color: background, // 背景色
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 44,
        alignment: Alignment.center,
        child: TextField(
          controller: controller.input,
          focusNode: controller.focus,
          textAlign: TextAlign.center,
          // 内容居中
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            // 只在未获取焦点时显示
            hintStyle: TextStyle(color: frontColor, fontSize: 14),
            border: InputBorder.none,
            // 无边框
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            isCollapsed: true,
            contentPadding: EdgeInsets.zero,
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: controller.search,
        ),
      );
    });
  }

  /// 搜索结果
  Widget _result(BuildContext context) {
    return Obx(
      () => LoadView(
        loading: controller.loading.value,
        message: controller.message.value,
        builder: (_) => ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: controller.list
                .map(
                  (it) => Card(
                    elevation: 0,
                    margin: EdgeInsets.only(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 14,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(it.nickname),
                      subtitle: Text('账号：${it.username}'),
                      onTap: () {
                        Get.toNamed(
                          MainRoute.userInfo,
                          arguments: {'id': it.id},
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
