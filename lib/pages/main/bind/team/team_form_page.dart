
import 'package:app/ctrls/main/bind_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 好友绑定
class TeamFormPage extends GetView<BindCtrl> {
  const TeamFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('群组申请')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        children: [_info(context), _form(context)],
      ),
    );
  }

  /// 用户信息 TODO 暂时不显示，完善后再处理
  Widget _info(BuildContext context) {
    return Row(children: [Column()]);
  }

  /// 申请表单
  Widget _form(BuildContext context) {
    final background = Theme.of(context).colorScheme.surfaceContainer;
    final frontColor = Theme.of(
      context,
    ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7);
    return Obx(() {
      final hint = controller.hasFocus.value ? null : '输入验证信息';
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller.remark,
              minLines: 3, maxLines: 3, maxLength: 200,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: frontColor, fontSize: 14),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.teamSubmit,
            child: Text('申请添加'),
          )
        ],
      );
    });
  }
}
