
class FindUser {

  int id;
  String? avatar;
  String nickname;
  String username;

  FindUser({
    required this.id,
    this.avatar,
    required this.nickname,
    required this.username,
  });

  factory FindUser.fromJson(dynamic json) => FindUser(
    id: json["id"],
    avatar: json["avatar"],
    nickname: json["nickname"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "nickname": nickname,
    "username": username,
  };

}