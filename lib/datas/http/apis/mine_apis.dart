
import 'package:app/cores/bases/base_http.dart';
import 'package:app/model/mine.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

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


  /// 设置当前用户头像
  static Future<bool> setAvatar(XFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name)
    });
    try {
      await _http.post('/mine/logo', data: formData);
      return true;
    } catch (e) {
      return false;
    }
  }

}