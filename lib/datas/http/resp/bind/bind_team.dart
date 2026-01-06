
class BindTeam {

  int id;
  String? logo;
  String nickname;
  String username;
  String remark;
  String createdAt;

  BindTeam({
    required this.id,
    this.logo,
    required this.nickname,
    required this.username,
    required this.remark,
    required this.createdAt,
  });

  factory BindTeam.fromJson(dynamic json) => BindTeam(
    id: json["id"],
    logo: json["logo"],
    nickname: json["nickname"],
    username: json["username"],
    remark: json["remark"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "nickname": nickname,
    "username": username,
    "remark": remark,
    "createdAt": createdAt,
  };

}