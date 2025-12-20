import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/conf/conf_safe.dart';
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
    return await _http.put('/conf/safe', data: form);
  }
}
