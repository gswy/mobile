
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/model/mine.dart';
import 'package:get/get.dart';

class MineApis {
  MineApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 获取当前登录用户
  static Future<Mine?> getMine() async {
    try {
      return await _http.get<Mine>('/mine', fromJson: Mine.fromJson);
    } catch (e) {
      return null;
    }
  }

}