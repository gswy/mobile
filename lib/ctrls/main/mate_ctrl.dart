import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/datas/hive/mapper/mate_hive.dart';
import 'package:app/datas/http/apis/mate_apis.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinyin/pinyin.dart';

/// 通讯页面
class MateCtrl extends BaseCtrl {

  /// 设置用户
  final _hive = Get.find<MateHive>();

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

  /// 请求列表
  final _list = <Mate>[].obs;

  /// 好友列表
  List<MateList> get mateList {
    /// 0. 定义处理结构
    final Map<String, List<MateItem>> group = {};

    /// 1. 遍历处理数据
    for (var m in _list) {
      final first = m.nickname.trim().characters.first;

      /// 1.1. 转换索引
      String index = '#';
      try {
        final short = PinyinHelper.getShortPinyin(first);
        index = short[0].toUpperCase();
      } catch (_) {}

      /// 1.2. 转换类型
      (group[index] ??= <MateItem>[]).add(
        MateItem(id: m.id, avatar: m.avatar, nickname: m.nickname),
      );
    }

    /// 2. 排序所有数据
    final keys = group.keys.toList()
      ..sort((a, b) {
        if (a == '#') return 1;
        if (b == '#') return -1;
        return a.compareTo(b);
      });

    /// 3. 最终处理分组
    return keys
        .map((index) => MateList(index: index, lists: group[index]!))
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    initMateList();
  }

  /// 刷新用户
  Future<void> initMateList() async {
    try {
      final list = await MateApis.getMateList();
      _list.value = list;
      for (var it in list) {
        _hive.add(it);
      }
    } catch (_) {}
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
