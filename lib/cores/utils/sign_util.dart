import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/dicts/auth_dict.dart';
import 'package:app/datas/http/resp/auth/signin_resp.dart';

/// 令牌保存
class SignUtil {

  /// 保存令牌
  static Future<void> save(SigninResp resp) async {
    /// 当前时间戳（秒）
    final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    /// 绝对过期时间（秒）
    final expiredAt = nowSec + resp.expires;

    /// 设置业务令牌
    LocalStore.setString(AuthDict.tokenKey, resp.token);
    /// 设置令牌效期
    LocalStore.setInt(AuthDict.expiresKey, resp.expires);
    /// 设置令牌过期
    LocalStore.setInt(AuthDict.expiredKey, expiredAt);
  }

  /// 是否有有效的业务令牌
  static bool hasToken() {
    final token = LocalStore.getString(AuthDict.tokenKey);
    if (token == null || token.isEmpty) {
      return false;
    }
    final expireAt = LocalStore.getInt(AuthDict.expiredKey) ?? 0;
    final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final res = expireAt > nowSec;
    if (! res) {
      LocalStore.remove(AuthDict.tokenKey);
      LocalStore.remove(AuthDict.expiresKey);
      LocalStore.remove(AuthDict.expiredKey);
    }
    return res;
  }

  /// 设置业务令牌过期
  static Future<void> setExpire() async {
    /// 获取令牌效期
    final expires = LocalStore.getInt(AuthDict.expiresKey) ?? 0;
    if (expires == 0) return;
    final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    /// 绝对过期时间
    final expiredAt = nowSec + expires;
    LocalStore.setInt(AuthDict.expiredKey, expiredAt);
  }

  /// 获取业务令牌（无效/不存在则返回空字符串）
  static String getToken() {
    if (!hasToken()) {
      return '';
    }
    return LocalStore.getString(AuthDict.tokenKey) ?? '';
  }

  /// 退出登录
  static Future<void> clean() async {
    await LocalStore.remove(AuthDict.tokenKey);
    await LocalStore.remove(AuthDict.expiresKey);
    await LocalStore.remove(AuthDict.expiredKey);
  }


}
