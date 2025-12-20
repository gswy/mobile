
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/utils/sign_util.dart';
import 'package:app/datas/http/resp/auth/signin_resp.dart';
import 'package:app/datas/http/resp/auth/signup_resp.dart';
import 'package:get/get.dart';

/// 授权接口
class AuthApis {

  AuthApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 获取地址
  static String get host => _http.baseUrl;

  /// 登录操作
  static Future<bool> signIn(String username, String password) async {
    try {
      final res = await _http.post<SigninResp>('/sign/in', data: {
        'username': username,
        'password': password,
      }, fromJson: SigninResp.fromJson);
      if (res == null) return false;
      await SignUtil.save(res);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 登录操作
  static Future<bool> signUp(String nickname, String username, String password) async {
    try {
      final res = await _http.post<SignupResp>(
        '/sign/up',
        data: {
          'nickname': nickname,
          'username': username,
          'password': password,
        },
        fromJson: SignupResp.fromJson,
      );
      if (res == null) return false;
      return true;
    } catch (e) {
      return false;
    }
  }

}