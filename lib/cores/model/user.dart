class User {
  /// 用户标识
  final int id;

  /// 用户头像
  final String avatar;

  /// 用户昵称
  final String nickname;

  /// 用户账号
  final String username;

  /// 用户手机
  final String phone;

  /// 用户邮箱
  final String email;

  /// 注册时间
  final int createdAt;

  User({
    required this.id,
    required this.avatar,
    required this.nickname,
    required this.username,
    required this.phone,
    required this.email,
    required this.createdAt,
  });

  /// json转换
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    avatar: json["avatar"],
    nickname: json["nickname"],
    username: json["username"],
    phone: json["phone"],
    email: json["email"],
    createdAt: json["createdAt"],
  );

}
