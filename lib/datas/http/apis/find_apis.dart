import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/find/find_user.dart';
import 'package:get/get.dart';

class FindApis {
  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 登录操作
  static Future<Page<FindUser>> search(String search) async {
    return await _http.getPage(
      '/find/user',
      query: {"search": search},
      fromJson: FindUser.fromJson,
    );
  }

}
