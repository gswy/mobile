
class UserInfo {
  final int id;
  final String? avatar;
  final String nickname;
  final String username;
  final bool isFriend;

  UserInfo({
    required this.id,
    required this.avatar,
    required this.nickname,
    required this.username,
    required this.isFriend,
  });

  factory UserInfo.fromJson(dynamic json) => UserInfo(
    id: json["id"],
    avatar: json["avatar"],
    nickname: json["nickname"],
    username: json["username"],
    isFriend: json["isFriend"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "nickname": nickname,
    "username": username,
    "isFriend": isFriend,
  };
}
