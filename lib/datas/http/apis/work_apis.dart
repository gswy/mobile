
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/work/work.dart';
import 'package:get/get.dart';

/// 授权接口
class WorkApis {

  WorkApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 登录操作
  static Future<Work?> getWork() async {
    try {
      return await _http.get<Work>('/work', fromJson: Work.fromJson);
    } catch (e) {
      return null;
    }
  }

}