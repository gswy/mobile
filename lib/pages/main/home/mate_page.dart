import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/dicts/bind_dict.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/route/main/main_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 通讯录页面
class MatePage extends BaseView<HomeCtrl> {
  MatePage({super.key});

  /// 每个分组标题用一个 GlobalKey，便于右侧索引滚动定位
  final Map<String, GlobalKey> _sectionKeys = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通讯录"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(MainRoute.find);
            },
            icon: Icon(IconUtil.userPlus, size: 20),
            tooltip: "添加朋友",
          ),
        ],
      ),
      body: Stack(
        children: [
          // 主列表（带搜索 + 分组）
          Obx(() {
            return ListView(
              controller: controller.scroll,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                const SizedBox(height: 14),
                _search(context),
                const SizedBox(height: 14),
                _menus(context),
                const SizedBox(height: 12),

                if (controller.loading.value)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (controller.mates.isEmpty)
                  _empty(context)
                else
                  _mates(context),

                const SizedBox(height: 16),
              ],
            );
          }),

          // 右侧索引条
          Positioned(right: 2, top: 0, bottom: 0, child: _index(context)),
        ],
      ),
    );
  }

  /// 搜索框（点击跳转到搜索页）
  Widget _search(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        // 可以跳转到搜索好友页面
        Get.toNamed(MainRoute.find);
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: color.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 18,
              color: color.onSurfaceVariant.withValues(alpha: 0.7),
            ),
            const SizedBox(width: 6),
            Text(
              "搜索好友 / 群聊",
              style: TextStyle(
                fontSize: 13,
                color: color.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 顶部功能菜单
  Widget _menus(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _menuItem(context, "新的朋友", IconUtil.user, () {
            Get.toNamed(
              MainRoute.bindNews,
              arguments: {'type': BindDict.mate},
            );
          }),
          const Divider(height: 0.2, thickness: 0.2),
          _menuItem(context, "群组通知", IconUtil.userTeam, () {
            Get.toNamed(
              MainRoute.bindNews,
              arguments: {'type': BindDict.team},
            );
          }),
        ],
      ),
    );
  }

  /// 菜单
  Widget _menuItem(
    BuildContext context,
    String name,
    IconData icon,
    Function()? onTap,
  ) {
    final theme = Theme.of(context);
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
        child: Icon(icon, size: 18, color: theme.colorScheme.primary),
      ),
      title: Text(name, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(IconUtil.commView, size: 18),
      onTap: onTap,
    );
  }

  /// 分组列表区域（A-Z + #）
  Widget _mates(BuildContext context) {
    final index = controller.keys;
    final matesByIndex = controller.mates;

    final List<Widget> children = [];

    for (final letter in index) {
      final list = matesByIndex[letter];
      if (list == null || list.isEmpty) continue;

      // 确保每个分组有一个 GlobalKey
      _sectionKeys.putIfAbsent(letter, () => GlobalKey());

      // 分组标题
      children.add(_matesHeader(letter));

      // 分组内的卡片（多个好友）
      children.add(
        Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              for (int i = 0; i < list.length; i++) ...[
                _mateItem(context, list[i]),
                if (i != list.length - 1)
                  const Divider(
                    height: 0,
                    indent: 60,
                    endIndent: 12,
                    thickness: 0.5,
                    color: Color(0x1F000000),
                  ),
              ],
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  /// 分组标题
  Widget _matesHeader(String letter) {
    return Container(
      key: _sectionKeys[letter], // 用于滚动定位
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0x99000000),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 单个好友 item
  Widget _mateItem(BuildContext context, Mate mate) {
    final theme = Theme.of(context);
    final String name = mate.nickname;
    final String short = name.isNotEmpty
        ? name.characters.first
        : "?"; // 需要 import 'package:flutter/gestures.dart' 吗？如果报错再加 characters 包

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
        child: Text(
          short,
          style: TextStyle(
            fontSize: 16,
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        size: 18,
        color: Color(0x66000000),
      ),
      onTap: () {
        Get.toNamed(MainRoute.infoMate, arguments: {'id': mate.id});
      },
    );
  }

  /// 右侧 A-Z 索引条
  Widget _index(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      final idx = controller.keys;
      if (idx.isEmpty) return const SizedBox.shrink();

      return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          width: 24,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.03),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: idx
                .map(
                  (letter) => GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _onIndexTap(letter),
                    child: SizedBox(
                      height: 16,
                      child: Center(
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize: 11,
                            color: theme.colorScheme.primary.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    });
  }

  /// 点击右侧索引时滚动到指定分组
  void _onIndexTap(String letter) {
    final key = _sectionKeys[letter];
    if (key == null) return;
    final ctx = key.currentContext;
    if (ctx == null) return;

    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      alignment: 0, // 顶部对齐
    );
  }

  /// 空状态
  Widget _empty(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Center(child: Text('暂无好友', style: TextStyle(fontSize: 14))),
    );
  }
}
