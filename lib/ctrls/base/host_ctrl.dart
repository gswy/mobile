
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/cores/value/host_constants.dart';
import 'package:app/datas/http/apis/host_apis.dart';
import 'package:app/route/base/base_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 地址服务
class HostCtrl extends BaseCtrl {

  /// 请求数据
  final _apis = Get.find<HostApis>();

  /// 输入控制
  final host = TextEditingController();

  /// 是否加载
  final loading = false.obs;

  /// 测试地址
  Future<void> test() async {
    // 是否为空
    final text = host.text.trim();
    if (text.isEmpty) {
      Toast.error('地址不能为空');
      return;
    }
    // 测试请求
    loading.value = true;
    final res = await _apis.test(text);
    loading.value = false;
    if (res) {
      LocalStore.setString(HostConstants.hostKey, text);
      Get.offNamed(BaseRoute.signin);
    }
  }


}