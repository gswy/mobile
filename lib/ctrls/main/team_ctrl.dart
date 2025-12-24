
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/model/team.dart';
import 'package:app/datas/http/apis/team_apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 群组列表
class TeamCtrl extends BaseCtrl {

  /// 页面滚动
  final scroll = ScrollController();

  /// 加载信息
  final message = ''.obs;

  /// 加载状态
  final loading = false.obs;

  /// 群组列表
  final teamList = <Team>[].obs;

  /// 当前页数
  final _teamCurr = 1.obs;

  /// 全部页数
  final _teamPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadTeamPage();
    scroll.addListener(() {
      final pos = scroll.position;
      if (pos.pixels >= pos.maxScrollExtent - 200) {
        loadTeamPage(page: _teamCurr.value + 1);
      }
    });
  }

  /// 刷新用户
  Future<void> loadTeamPage({int page = 1, bool refresh = false}) async {
    if (loading.value) return;

    /// 没有更多页就不请求（可选）
    if (!refresh && _teamPage.value != 0 && page > _teamPage.value) {
      return;
    }

    loading.value = true;
    message.value = '';

    final res = await TeamApis.getTeamPage(page: page);
    if (res == null) {
      loading.value = false;
      message.value = '加载失败';
      return;
    }

    /// 设置分页
    _teamCurr.value = res.page;       // 当前页
    _teamPage.value = res.pageNum;    // 总页数

    if (refresh) {
      teamList.value = res.data;
    } else {
      teamList.addAll(res.data);
    }

    loading.value = false;
  }

}