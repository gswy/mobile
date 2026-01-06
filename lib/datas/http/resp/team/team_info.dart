class TeamInfo {
  final int id;
  final int role;
  final bool join;
  final bool mute;
  final String name;
  final String? logo;
  final List<TeamUserInfo> users;

  TeamInfo({
    required this.id,
    required this.name,
    required this.role,
    required this.join,
    required this.mute,
    required this.logo,
    required this.users,
  });

  factory TeamInfo.fromJson(dynamic json) {
    final rawUsers = json['users'];
    final List usersList = rawUsers is List ? rawUsers : <dynamic>[];
    final users = usersList
        .map((it) => TeamUserInfo.fromJson(Map<String, dynamic>.from(it as Map)))
        .toList();
    return TeamInfo(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      role: json["role"],
      join: json["join"],
      mute: json["mute"],
      users: users,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "role": role,
    "join": join,
    "users": users,
  };
}

class TeamUserInfo {
  final int id;
  final String? logo;
  final String nickname;

  TeamUserInfo({
    required this.id,
    required this.logo,
    required this.nickname,
  });

  factory TeamUserInfo.fromJson(dynamic json) {
    return TeamUserInfo(
      id: json["id"],
      logo: json["logo"],
      nickname: json["nickname"],
    );
  }
}
