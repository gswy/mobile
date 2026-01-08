import 'package:app/cores/utils/host_util.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/views/load_view.dart';
import 'package:app/cores/views/user_logo.dart';
import 'package:app/ctrls/main/home/work_ctrl.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 企业信息
class WorkPage extends GetView<WorkCtrl> {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkCtrl>(
      initState: (_) {
        controller.init();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('工作')),
        body: Obx(() {
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return RefreshIndicator(
                onRefresh: () async {
                  controller.load();
                },
                child: ListView(
                  padding: EdgeInsets.all(14),
                  children: [
                    _swap(context),
                    _firm(context),
                    _menu(context),
                    _task(context),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }

  /// 顶部轮播
  Widget _swap(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(bottom: 18),
      child: AspectRatio(
        aspectRatio: 1.818,
        child: ExtendedImage.network(
          '${HostUtil.getHttp()}/file/logo.jpg',
          fit: BoxFit.cover,
          cache: true,
        ),
      ),
    );
  }

  /// 公司卡片
  Widget _firm(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.only(bottom: 18),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              spacing: 14,
              children: [
                UserLogo(url: null, name: "科"),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        '${controller.work.value?.firm.name}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${controller.work.value?.firm.desc}',
                        style: TextStyle(fontSize: 14, color: scheme.secondary),
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(IconUtil.commQCode)),
              ],
            ),
            SizedBox(height: 16),
            Divider(thickness: 0.2, height: 0.2),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _firmItem(context, "员工数", '${controller.work.value?.stat.users}'),
                _firmItem(context, "管理数", '${controller.work.value?.stat.admin}'),
                _firmItem(context, "在线数", '${controller.work.value?.stat.lines}'),
                _firmItem(context, "任务数", '${controller.work.value?.stat.tasks}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 卡片底部
  Widget _firmItem(BuildContext context, String title, String num) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          num,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: scheme.primary,
          ),
        ),
        Text(title, style: TextStyle(fontSize: 14, color: scheme.secondary)),
      ],
    );
  }

  /// 宫格菜单
  Widget _menu(BuildContext context) {
    final List<Map<String, dynamic>> menu = [
      {'name': '公告', 'icon': IconUtil.workBellFull},
      {'name': '任务', 'icon': IconUtil.workTaskFull},
      {'name': '文件', 'icon': IconUtil.workFileFull},
      {'name': '审批', 'icon': IconUtil.workExamFull},
      {'name': '上报', 'icon': IconUtil.workExamFull},
      {'name': '签到', 'icon': IconUtil.workSignFull},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final parent = constraints.maxWidth;
        final cols = 4;
        final spacing = 16.0; // 每个宫格间距
        final padding = 14.0;
        final width = (parent - padding * 2 - spacing * (cols - 1)) / cols;
        return Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 18),
          child: Padding(
            padding: EdgeInsetsGeometry.all(padding),
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: menu
                  .map(
                    (it) => _menuItem(context, width, it['name'], it['icon']),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  /// 菜单子项
  Widget _menuItem(
    BuildContext context,
    double width,
    String name,
    IconData icon,
  ) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.6,
            height: width * 0.5,
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 22, color: scheme.onPrimaryContainer),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: scheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget _task(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Obx(() {
        final tasks = controller.tasks;
        final children = <Widget>[];
        for (var i = 0; i < tasks.length; i++) {
          final it = tasks[i];
          children.add(_taskItem(context, it.name, it.content, it.urgent));
          if (i != tasks.length - 1) {
            children.add(const Divider(height: 0.2, thickness: 0.2));
          }
        }
        return Column(children: children);
      }),
    );
  }

  ///
  Widget _taskItem(
    BuildContext context,
    String name,
    String content,
    int urgent,
  ) {
    return ListTile(title: Text(name), subtitle: Text(content));
  }
}
