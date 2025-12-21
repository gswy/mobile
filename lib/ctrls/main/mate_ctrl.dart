import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/datas/http/apis/mate_apis.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 通讯页面
class MateCtrl extends BaseCtrl {

  /// 页面滚动
  final scroll = ScrollController();

  /// 加载状态
  final loading = false.obs;

  /// 加载结果
  final message = ''.obs;

  /// 通讯菜单
  final mateMenu = <MateMenu>[
    MateMenu(
      num: 0,
      name: '新的朋友',
      icon: IconUtil.usersFull,
      onTap: () {
        Get.toNamed(MainRoute.bindUserList);
      },
    ),
    MateMenu(
      num: 0,
      name: '群组通知',
      icon: IconUtil.bellsFull,
      onTap: () {
        Get.toNamed(MainRoute.bindTeamList);
      },
    ),
    MateMenu(
      num: 0,
      name: '我的群组',
      icon: IconUtil.teamsFull,
      onTap: () {
        Get.toNamed(MainRoute.team);
      },
    ),
  ];

  /// 用户列表
  final mateList = <MateList>[].obs;

  /// 当前页数
  final _mateCurr = 1.obs;

  /// 全部页数
  final _matePage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadMatePage();
    scroll.addListener(() {
      final pos = scroll.position;
      if (pos.pixels >= pos.maxScrollExtent - 200) {
        loadMatePage(page: _mateCurr.value + 1);
      }
    });
  }

  /// 刷新用户
  Future<void> loadMatePage({int page = 1, bool refresh = false}) async {
    if (loading.value) return;

    /// 没有更多页就不请求（可选）
    if (!refresh && _matePage.value != 0 && page > _matePage.value) {
      return;
    }

    loading.value = true;
    message.value = '';

    final res = await MateApis.getMatePage(page: page);
    if (res == null) {
      loading.value = false;
      message.value = '加载失败';
      return;
    }

    /// 设置分页
    _mateCurr.value = res.page;       // 当前页
    _matePage.value = res.pageNum;    // 总页数

    /// 把现有数据（或空）转成 map，方便分组/合并
    final Map<String, List<MateItem>> map = {};

    if (!refresh) {
      for (final g in mateList) {
        map[g.index] = List<MateItem>.from(g.lists);
      }
    }

    /// 合并本页数据
    for (final m in res.data) {
      final key = (m.index.isEmpty ? '#' : m.index).toUpperCase();
      (map[key] ??= <MateItem>[]).add(
        MateItem(
          id: m.id,
          avatar: m.avatar,
          nickname: m.nickname,
        ),
      );
    }

    /// 组内去重
    for (final entry in map.entries) {
      final seen = <int>{};
      entry.value.retainWhere((e) => seen.add(e.id));
      entry.value.sort((a, b) => a.nickname.compareTo(b.nickname));
    }

    /// key 排序：A-Z，# 最后
    final keys = map.keys.toList()
      ..sort((a, b) {
        if (a == '#') return 1;
        if (b == '#') return -1;
        return a.compareTo(b);
      });

    mateList.assignAll(
      keys.map((k) => MateList(index: k, lists: map[k]!)).toList(),
    );
    loading.value = false;
  }
}

/// 通讯好友
class MateList {
  final String index;
  final List<MateItem> lists;

  MateList({required this.index, required this.lists});
}

/// 单个选项
class MateItem {
  final int id;
  final String? avatar;
  final String nickname;

  MateItem({required this.id, this.avatar, required this.nickname});
}

/// 通讯菜单
class MateMenu {
  final RxInt num;
  final String name;
  final IconData icon;
  final Function() onTap;

  MateMenu({
    required int num,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : num = num.obs;
}
