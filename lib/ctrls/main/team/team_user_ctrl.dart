
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/datas/http/apis/team_apis.dart';
import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamUserCtrl extends BaseCtrl {

  /// 群组标识
  late int id;

  /// 页面滚动
  final scroll = ScrollController();

  /// 加载信息
  final message = ''.obs;

  /// 加载状态
  final loading = false.obs;

  /// 群组列表
  final userList = <User>[].obs;

  /// 当前页数
  final _userCurr = 1.obs;

  /// 全部页数
  final _userPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map;
    id = args['id'] as int;
    scroll.addListener(() {
      final pos = scroll.position;
      if (pos.pixels >= pos.maxScrollExtent - 200) {
        loadUserPage(page: _userCurr.value + 1);
      }
    });
  }

  /// 刷新用户
  Future<void> loadUserPage({int page = 1, bool refresh = false}) async {
    if (loading.value) return;

    /// 没有更多页就不请求（可选）
    if (!refresh && _userPage.value != 0 && page > _userPage.value) {
      return;
    }

    loading.value = true;
    message.value = '';

    final res = await TeamApis.getUserPage(id, page: page);
    if (res == null) {
      loading.value = false;
      message.value = '加载失败';
      return;
    }

    /// 设置分页
    _userCurr.value = res.page;       // 当前页
    _userPage.value = res.pageNum;    // 总页数

    if (refresh) {
      userList.value = res.data;
    } else {
      userList.addAll(res.data);
    }

    loading.value = false;
  }

}