

class TeamInfo {
  final int id;
  final String name;
  final String? avatar;
  final bool isJoined;
  final bool isManage;

  TeamInfo({
    required this.id,
    required this.name,
    required this.avatar,
    required this.isJoined,
    required this.isManage,
  });

  factory TeamInfo.fromJson(dynamic json) => TeamInfo(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    isJoined: json["isJoined"],
    isManage: json["isManage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "isJoined": isJoined,
    "isManage": isManage,
  };
}
