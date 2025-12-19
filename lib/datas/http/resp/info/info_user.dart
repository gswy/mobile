
class InfoUser {
  final int id;
  final String? avatar;
  final String nickname;
  final String username;
  final bool isFriend;

  InfoUser({
    required this.id,
    required this.avatar,
    required this.nickname,
    required this.username,
    required this.isFriend,
  });

  factory InfoUser.fromJson(dynamic json) => InfoUser(
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
