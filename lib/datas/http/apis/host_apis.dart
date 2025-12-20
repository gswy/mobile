
import 'package:app/cores/bases/base_http.dart';
import 'package:get/get.dart';

class HostApis {

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 测试请求
  static Future<bool> test(String host) async {
    _http.setBaseURL('https://$host');
    try {
      await _http.get('/test');
      return true;
    } catch (e) {
      return false;
    }
  }

}