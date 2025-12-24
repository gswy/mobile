
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/datas/http/apis/mate_apis.dart';
import 'package:app/datas/http/apis/team_apis.dart';
import 'package:app/model/mate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 添加群组
class PlusCtrl extends BaseCtrl {

  final message = ''.obs;

  final loading = false.obs;

  /// 页面滚动
  final scroll = ScrollController();

  /// 用户列表
  final mateList = <MateList>[].obs;

  /// 当前页数
  final _mateCurr = 1.obs;

  /// 全部页数
  final _matePage = 1.obs;

  /// 是否选中
  final selected = <int>[].obs;

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

    if (refresh) {
      mateList.value = res.data;
    } else {
      mateList.addAll(res.data);
    }

    loading.value = false;
  }

  /// 创建并进入会话
  Future<void> submit() async {
    final res = await TeamApis.addTeam(selected);
    if (res != null) {
      Get.back();
    }
  }

}