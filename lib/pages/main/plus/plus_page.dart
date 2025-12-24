import 'package:app/ctrls/main/plus_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 创建群聊
class PlusPage extends GetView<PlusCtrl> {
  const PlusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlusCtrl>(
      initState: (_) {
        controller.loadMatePage(refresh: true);
      },
      builder: (_) => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text('创建群聊'),
            actions: [
              ElevatedButton(
                onPressed: controller.selected.isEmpty ? null : controller.submit,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text('完成'),
              ),
              SizedBox(width: 14),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.loadMatePage(refresh: true);
            },
            child: ListView.separated(
              padding: EdgeInsets.all(14),
              itemBuilder: _item,
              separatorBuilder: _line,
              itemCount: controller.mateList.length,
            ),
          ),
        ),
      ),
    );
  }

  /// 分割
  Widget _line(BuildContext context, int index) {
    return Divider(thickness: 0.2, height: 0.2);
  }

  /// 选择子项
  Widget _item(BuildContext context, int index) {
    return Obx(() {
      final mate = controller.mateList[index];
      final selected = controller.selected.contains(mate.id);

      return CheckboxListTile(
        contentPadding: EdgeInsets.all(0),
        value: selected,
        onChanged: (_) {
          if (selected) {
            controller.selected.remove(mate.id);
          } else {
            controller.selected.add(mate.id);
          }
        },
        controlAffinity: ListTileControlAffinity.trailing,
        title: Row(
          children: [
            const CircleAvatar(radius: 18),
            const SizedBox(width: 12),
            Expanded(child: Text(mate.nickname)),
          ],
        ),
        dense: true,
      );
    });
  }
}
