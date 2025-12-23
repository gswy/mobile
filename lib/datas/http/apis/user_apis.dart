
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/user/user_info.dart';
import 'package:get/get.dart';

class UserApis {

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 获取用户信息
  static Future<UserInfo?> getUserInfo(int id) async {
    return await _http.get<UserInfo>('/user/$id', fromJson: UserInfo.fromJson);
  }


}