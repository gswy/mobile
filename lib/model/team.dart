
class Team {

}

class TeamList {
  final int id;
  final String name;
  final String? avatar;
  final int createdAt;

  TeamList({required this.id, required this.name, required this.avatar, required this.createdAt});

  /// json转换
  factory TeamList.fromJson(Map<String, dynamic> json) => TeamList(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    createdAt: json["createdAt"],
  );

}