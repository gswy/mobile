
class UserInfo {
  final int id;
  final String? logo;
  final String nickname;
  final String username;
  final bool isFriend;

  UserInfo({
    required this.id,
    required this.logo,
    required this.nickname,
    required this.username,
    required this.isFriend,
  });

  factory UserInfo.fromJson(dynamic json) => UserInfo(
    id: json["id"],
    logo: json["logo"],
    nickname: json["nickname"],
    username: json["username"],
    isFriend: json["isFriend"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "nickname": nickname,
    "username": username,
    "isFriend": isFriend,
  };
}
