
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/utils/sign_util.dart';
import 'package:app/cores/value/host_constants.dart';
import 'package:app/datas/http/resp/auth/signin_resp.dart';
import 'package:app/datas/http/resp/auth/signup_resp.dart';
import 'package:get/get.dart';

class AuthApis extends GetxService {

  final _http = Get.find<BaseHttp>();

  /// 获取地址
  String get host => _http.baseUrl;

  @override
  void onInit() {
    super.onInit();
    /// 初始化地址
    final host = LocalStore.getString(HostConstants.hostKey);
    if (host != null) {
      _http.setBaseURL('https://$host');
    }
  }

  /// 登录操作
  Future<bool> signIn(String username, String password) async {
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
  Future<bool> signUp(String nickname, String username, String password) async {
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