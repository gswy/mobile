
import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/datas/http/apis/auth_apis.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 登录控制器
class SignCtrl extends BaseCtrl {

  /// 连接处理
  final _conn = Get.find<BaseConn>();

  final _auth = Get.find<BaseAuth>();

  /// 连接地址
  final host = ''.obs;

  /// 是否加载中
  final loading = false.obs;

  /// 用户昵称
  final nickname = TextEditingController();

  /// 账号输入
  final username = TextEditingController();

  /// 密码输入
  final password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    host.value = AuthApis.host;
  }

  /// 进行登录
  Future<void> signIn() async {
    final res = await AuthApis.signIn(username.text.trim(), password.text.trim());
    if (res) {
      await _auth.init();
      await _conn.star();
      Get.offNamed(MainRoute.home);
    }
  }

  /// 注册动作
  Future<void> signUp() async {
    loading.value = true;
    final res = await AuthApis.signUp(
      nickname.text.trim(),
      username.text.trim(),
      password.text.trim(),
    );
    loading.value = false;
    if (res) {
      Toast.error('注册成功');
    }
  }


}