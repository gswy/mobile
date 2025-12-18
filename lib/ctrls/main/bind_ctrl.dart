
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/datas/http/apis/bind_apis.dart';
import 'package:app/datas/http/resp/bind/bind_mate.dart';
import 'package:app/datas/http/resp/find/find_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 关系绑定
class BindCtrl extends BaseCtrl {

  /// 远程请求
  final _apis = Get.find<BindApis>();

  /// ------------ 公共信息 -------------
  /// 提示信息
  final message = ''.obs;
  /// 是否加载
  final loading = false.obs;

  /// ------------ 申请页面 -------------
  /// 用户信息
  final user = Rxn(FindUser);

  /// 申请信息
  final mate = Rxn<BindMate>();

  /// 输入焦点
  final focus = FocusNode();

  /// 是否获取焦点
  final hasFocus = false.obs;

  /// 输入内容
  final remark = TextEditingController();

  /// 判定类型
  Future<void> init() async {
    final type = args['type'] as int;
    if (type == 0) {

    }
  }

  /// ------------ 新的朋友 -------------
  /// 数据列表
  final userList = <BindMate>[].obs;
  /// 当前页码
  final userPage = 1.obs;
  /// 每页大小
  final userSize = 20.obs;
  /// 加载列表
  Future<void> initMate() async {
    loading.value = true;
    try {
      final res = await _apis.getBindMates();
      userList.value = res.data;
      if (userList.isEmpty) {
        message.value = '暂无数据';
      } else {
        message.value = '';
      }
    } catch (_) {
      message.value = '请求错误';
    } finally {
      loading.value = false;
    }
  }

  /// 获取消息
  Future<void> getNewsList() async {
    loading.value = true;
    try {
      final res = await _apis.getBindMates();
      userList.value = res.data;
    } catch (_) { } finally {
      loading.value = false;
    }
  }

  /// 进行绑定
  Future<void> submit() async {
    final id = this.id as int;
    final res = await _apis.bindUser(id, remark.text);
    if (res) {
      Get.back();
    }
  }

  /// ------------ 好友审核 -------------
  /// 加载信息
  Future<void> loadBindMate() async {
    loading.value = true;
    try {
      mate.value = await _apis.getBindMate(id as int);
    } catch (_) {
      Get.back();
    } finally {
      loading.value = false;
    }
  }

  /// 提交申请
  Future<void> access() async {
    loading.value = true;
    try {
      await _apis.handBindMate(id as int, 1);
      Get.back();
    } catch (_) {} finally {
      loading.value = false;
    }
  }

  /// 拒绝申请
  Future<void> reject() async {
    loading.value = true;
    try {
      await _apis.handBindMate(id as int, -1);
      Get.back();
    } catch (_) {} finally {
      loading.value = false;
    }
  }

  /// 忽略申请
  Future<void> ignore() async {
    loading.value = true;
    try {
      await _apis.handBindMate(id as int, 0);
      Get.back();
    } catch (_) {} finally {
      loading.value = false;
    }
  }



}