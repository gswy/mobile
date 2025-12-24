
class Team {
  final int id;
  final String name;
  final String? avatar;

  Team({required this.id, required this.name, required this.avatar});

  /// json转换
  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
  );
}