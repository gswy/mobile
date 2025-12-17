import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/find/find_user.dart';
import 'package:get/get.dart';

class FindApis extends GetxService {
  /// 请求实例
  final _http = Get.find<BaseHttp>();

  /// 获取地址
  String get host => _http.baseUrl;

  /// 登录操作
  Future<Page<FindUser>> search(String search) async {
    return await _http.getPage(
      '/find/user',
      query: {"search": search},
      fromJson: FindUser.fromJson,
    );
  }

}
