
class FindUser {

  int id;
  String? logo;
  String nickname;
  String username;

  FindUser({
    required this.id,
    this.logo,
    required this.nickname,
    required this.username,
  });

  factory FindUser.fromJson(dynamic json) => FindUser(
    id: json["id"],
    logo: json["logo"],
    nickname: json["nickname"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "nickname": nickname,
    "username": username,
  };

}