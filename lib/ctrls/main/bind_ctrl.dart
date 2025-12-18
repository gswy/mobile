import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/datas/http/apis/bind_apis.dart';
import 'package:app/datas/http/resp/bind/bind_team.dart';
import 'package:app/datas/http/resp/bind/bind_user.dart';
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
  /// 输入焦点
  final focus = FocusNode();

  /// 是否获取焦点
  final hasFocus = false.obs;

  /// 输入内容
  final remark = TextEditingController();

  /// 进行绑定
  Future<void> userSubmit() async {
    final id = this.id as int;
    final res = await _apis.bindUser(id, remark.text);
    if (res) {
      Get.back();
    }
  }

  /// 进行绑定
  Future<void> teamSubmit() async {
    final id = this.id as int;
    final res = await _apis.bindTeam(id, remark.text);
    if (res) {
      Get.back();
    }
  }

  /// ------------ 新的朋友 -------------
  /// 数据列表
  final userList = <BindUser>[].obs;

  /// 当前页码
  final userPage = 1.obs;

  /// 每页大小
  final userSize = 20.obs;

  /// 加载列表
  Future<void> initUserList() async {
    loading.value = true;
    try {
      final res = await _apis.getBindUserList();
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

  /// ------------ 群组通知 -------------
  /// 数据列表
  final teamList = <BindTeam>[].obs;

  /// 当前页码
  final teamPage = 1.obs;

  /// 每页大小
  final teamSize = 20.obs;

  /// 加载列表
  Future<void> initTeamList() async {
    loading.value = true;
    try {
      final res = await _apis.getBindTeamList();
      teamList.value = res.data;
      if (teamList.isEmpty) {
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

  /// ------------ 好友审核 -------------
  /// 用户信息
  final user = Rxn<BindUser>();

  /// 加载信息
  Future<void> loadBindUser() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      final res = await _apis.getBindUser(id);
      if (res != null) {
        user.value = res;
        message.value = '';
      } else {
        message.value = '加载失败';
      }
    } catch (_) {
      Get.back();
    } finally {
      loading.value = false;
    }
  }

  /// ------------ 群组审核 -------------
  /// 用户信息
  final team = Rxn<BindUser>();

  /// 加载信息
  Future<void> loadBindTeam() async {
    final id = this.id as int;
    loading.value = true;
    try {
      final res = await _apis.getBindTeam(id);
      if (res != null) {
        team.value = res;
        message.value = '';
      } else {
        message.value = '加载失败';
      }
    } catch (_) {
      Get.back();
    } finally {
      loading.value = false;
    }
  }

  /// 提交申请
  Future<void> userAccess() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      final res = await _apis.handBindUser(id, 1);
      if (res) {
        Get.back();
      } else {

      }
    } catch (e) {
      Get.log('');
    } finally {
      loading.value = false;
    }
  }

  /// 提交申请
  Future<void> teamAccess() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      await _apis.handBindTeam(id, 1);
      Get.back();
    } catch (_) {
    } finally {
      loading.value = false;
    }
  }

  /// 拒绝申请
  Future<void> userReject() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      await _apis.handBindUser(id, -1);
      Get.back();
    } catch (_) {
    } finally {
      loading.value = false;
    }
  }

  /// 拒绝申请
  Future<void> teamReject() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      await _apis.handBindTeam(id, -1);
      Get.back();
    } catch (_) {
    } finally {
      loading.value = false;
    }
  }

  /// 忽略申请
  Future<void> userIgnore() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      await _apis.handBindUser(id, 0);
      Get.back();
    } catch (_) {
    } finally {
      loading.value = false;
    }
  }

  /// 忽略申请
  Future<void> teamIgnore() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      await _apis.handBindTeam(id, 0);
      Get.back();
    } catch (_) {
    } finally {
      loading.value = false;
    }
  }

}
