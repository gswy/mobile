import 'dart:convert';

import 'package:app/cores/bases/base_http.dart';
import 'package:app/model/conf.dart';
import 'package:get/get.dart';

class ConfApis {
  ConfApis._();

  static final _http = Get.find<BaseHttp>();

  /// 获取隐私配置
  static Future<ConfSafe?> getSafe() async {
    return await _http.get<ConfSafe>('/conf/safe', fromJson: ConfSafe.fromJson);
  }

  /// 设置隐私配置
  static Future<bool> setSafe(ConfSafe form) async {
    try {
      await _http.put('/conf/safe', data: jsonEncode(form));
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 获取登录设备
  static Future<List<Desk>> getDeskList() async {
    try {
      return await _http.getList('/conf/desks', fromJson: Desk.fromJson);
    } catch (_) {
      return List.empty();
    }
  }



}
