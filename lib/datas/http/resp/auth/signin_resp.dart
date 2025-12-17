
/// 登录结果
class SigninResp {
  String token;
  int expires;

  SigninResp({
    required this.token,
    required this.expires,
  });

  factory SigninResp.fromJson(dynamic json) => SigninResp(
    token: json["token"],
    expires: json["expires"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expires": expires,
  };
}