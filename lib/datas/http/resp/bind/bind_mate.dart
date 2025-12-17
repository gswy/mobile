
class BindMate {

  int id;
  String? avatar;
  String nickname;
  String username;
  String remark;
  String createdAt;

  BindMate({
    required this.id,
    this.avatar,
    required this.nickname,
    required this.username,
    required this.remark,
    required this.createdAt,
  });

  factory BindMate.fromJson(dynamic json) => BindMate(
    id: json["id"],
    avatar: json["avatar"],
    nickname: json["nickname"],
    username: json["username"],
    remark: json["remark"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "nickname": nickname,
    "username": username,
    "remark": remark,
    "createdAt": createdAt,
  };

}