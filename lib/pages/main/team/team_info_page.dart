import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/views/user_logo.dart';
import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/main/info_ctrl.dart';
import 'package:app/datas/http/resp/team/team_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 好友详情
class TeamInfoPage extends GetView<InfoCtrl> {
  const TeamInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoCtrl>(
      initState: (_) {
        controller.initInfoTeam();
      },
      builder: (_) => Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text('群组详情'),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(IconUtil.more),
                padding: EdgeInsets.zero,
                offset: Offset(0, 52),
                onSelected: (v) {
                  switch (v) {
                    case 'cede':
                      // TODO: 修改群名
                      break;
                    case 'dele':
                      // TODO: 成员管理
                      break;
                    case 'quit':
                      // TODO: 退出群
                      break;
                  }
                },
                itemBuilder: (_) => [
                  if (controller.team.value != null &&
                      controller.team.value?.role == 0) ...[
                    PopupMenuItem(value: 'cede', child: Text('转让群组')),
                    PopupMenuItem(value: 'dele', child: Text('解散群组')),
                  ],
                  if (controller.team.value?.role != 0) ...[
                    PopupMenuItem(value: 'quit', child: Text('退出群组')),
                  ],
                ],
              ),
            ],
          ),
          body: LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (_) {
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                children: [_team(context), _acts(context)],
              );
            },
          ),
        ),
      ),
    );
  }

  /// 用户信息
  Widget _team(BuildContext context) {
    return Obx(() {
      final team = controller.team.value;
      return Card(
        elevation: 0,
        margin: EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            spacing: 14,
            children: [
              UserLogo(
                url: team!.logo,
                name: team.name,
                onTap: () {
                  if (team.join && (team.role == 0 || team.role == 1)) {
                    controller.handLogo();
                  }
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(team.name, style: TextStyle(fontSize: 16)),
                    Text('ID：${team.id}', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// 用户操作
  Widget _acts(BuildContext context) {
    final team = controller.team.value;
    if (team!.join) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          _users(context, team),
          if (team.role == 0) _owner(context, team),
          if (team.role == 1) _admin(context, team),
          ElevatedButton(onPressed: controller.handRoom, child: Text('发送消息')),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(onPressed: controller.handBind, child: Text('加入群组')),
        ],
      );
    }
  }

  /// 用户展示
  Widget _users(BuildContext context, TeamInfo team) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(' 群组用户', style: TextStyle(color: scheme.secondary, fontSize: 12)),
        Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 10),
          child: LayoutBuilder(
            builder: (context, c) {
              const cols = 6;
              const spacing = 12.0;
              const padding = 12.0;
              final maxW = c.maxWidth;
              final itemW = (maxW - padding * 2 - spacing * (cols - 1)) / cols;

              int len = team.users.length > 10 ? 10 : team.users.length + 1;

              return Padding(
                padding: EdgeInsets.all(padding),
                child: Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: List.generate(len, (i) {
                    if (len - 1 == i) {
                      return GestureDetector(
                        onTap: () async {
                          final ids = await _pickUser(context);
                          if (ids != null && ids.isNotEmpty) {
                            controller.addTeamUser(ids);
                          }
                        },
                        child: SizedBox(
                          width: itemW,
                          child: Column(
                            spacing: 4,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  width: itemW,
                                  decoration: BoxDecoration(
                                    color: scheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    IconUtil.plus,
                                    color: scheme.primary,
                                  ),
                                ),
                              ),
                              Text(
                                '添加',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      final user = team.users[i];
                      return SizedBox(
                        width: itemW,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 4,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: UserLogo(
                                url: user.logo,
                                name: user.nickname,
                                radio: 8,
                              ),
                            ),
                            Text(
                              user.nickname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// 管理员操作
  Widget _owner(BuildContext context, TeamInfo team) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' 群组管理', style: TextStyle(color: scheme.secondary, fontSize: 12)),
        Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              ListTile(
                title: Text('修改群名'),
                onTap: () async {
                  final name = await _input(context, team.name);
                  if (name == null || name.isEmpty) return;
                  controller.handName(name);
                },
              ),
              Divider(height: 0.2, thickness: 0.2),
              SwitchListTile(
                value: team.mute,
                onChanged: (value) {
                  controller.handMute();
                },
                title: Text('群组禁言'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 群管理操作
  Widget _admin(BuildContext context, TeamInfo team) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ListTile(title: Text('修改群名'), onTap: () {}),
          Divider(height: 0.2, thickness: 0.2),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text('群组禁言'),
          ),
        ],
      ),
    );
  }

  /// 输入内容
  Future<String?> _input(BuildContext context, String name) async {
    final ctrl = TextEditingController(text: name);
    final focus = FocusNode();

    final result = await showDialog<String?>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!focus.hasFocus) focus.requestFocus();
        });
        return AlertDialog(
          title: const Text('修改群名'),
          content: TextField(
            controller: ctrl,
            focusNode: focus,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(hintText: '请输入群名', isDense: true),
            onSubmitted: (_) => Navigator.of(ctx).pop(ctrl.text.trim()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(null),
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(ctrl.text.trim()),
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
    focus.dispose();
    ctrl.dispose();
    return result?.trim();
  }

  /// 添加用户
  Future<List<int>?> _pickUser(BuildContext context) async {
    final ids = <int>[].obs;
    final scheme = Theme.of(context).colorScheme;
    Future.microtask(() => controller.loadUsers());
    return showModalBottomSheet<List<int>?>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          minChildSize: 0.2,
          maxChildSize: 1,
          builder: (ctx, ctrl) {
            return Column(
              children: [
                Expanded(
                  child: Obx(() {
                    ids.length;
                    return ListView.separated(
                      itemBuilder: (ctx, i) {
                        final user = controller.users[i];
                        return CheckboxListTile(
                          value: ids.contains(user.id),
                          title: Text(user.nickname),
                          onChanged: (bool? value) {
                            if (value == null) return;
                            if (value) {
                              ids.add(user.id);
                            } else {
                              ids.remove(user.id);
                            }
                          },
                        );
                      },
                      separatorBuilder: (ctx, i) =>
                          Divider(height: 0.2, thickness: 0.2),
                      itemCount: controller.users.length,
                    );
                  }),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Row(
                      spacing: 20,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: scheme.errorContainer,
                              foregroundColor: scheme.error,
                            ),
                            onPressed: () => Navigator.of(ctx).pop(null),
                            child: const Text('取消'),
                          ),
                        ),
                        Expanded(
                          child: Obx(
                            () => ElevatedButton(
                              onPressed: ids.isEmpty
                                  ? null
                                  : () => Navigator.of(ctx).pop(ids),
                              child: const Text('添加'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
