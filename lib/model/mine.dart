
class Mine {
  final int id;
  final String nickname;
  final String username;
  final String? logo;
  final String createdAt;

  Mine({
    required this.id,
    required this.nickname,
    required this.username,
    this.logo,
    required this.createdAt,
  });

  /// json转换
  factory Mine.fromJson(Map<String, dynamic> json) => Mine(
    id: json["id"],
    nickname: json["nickname"],
    username: json["username"],
    logo: json["logo"],
    createdAt: json["createdAt"],
  );

}
