
/// 注册结果
class SignupResp {
  String msg;

  SignupResp({
    required this.msg,
  });

  factory SignupResp.fromJson(Map<String, dynamic> json) => SignupResp(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}