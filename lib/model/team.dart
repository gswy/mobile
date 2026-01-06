
class Team {
  final int id;
  final String name;
  final String? logo;

  Team({required this.id, required this.name, required this.logo});

  /// json转换
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
    );
  }
}
