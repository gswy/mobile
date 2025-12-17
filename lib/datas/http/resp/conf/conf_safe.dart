
/// 隐私设置
class ConfSafe {
  int auto;
  SafeFind find;
  SafeBind bind;
  ConfSafe({required this.auto, required this.find, required this.bind});

  factory ConfSafe.fromJson(Map<String, dynamic> json) => ConfSafe(
    auto: json["auto"],
    find: SafeFind.fromJson(json["find"]),
    bind: SafeBind.fromJson(json["bind"]),
  );

  Map<String, dynamic> toJson() => {
    "auto": auto,
    "find": find,
    "bind": bind,
  };
}

/// 查找设置
class SafeFind {
  bool id;
  bool email;
  bool phone;
  bool nickname;
  bool username;
  SafeFind({required this.id, required this.email, required this.phone, required this.nickname, required this.username});

  factory SafeFind.fromJson(Map<String, dynamic> json) => SafeFind(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    nickname: json["nickname"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "nickname": nickname,
    "username": username,
  };
}

/// 绑定设置
class SafeBind {
  bool card;
  bool code;
  bool team;
  SafeBind({required this.card, required this.code, required this.team});

  factory SafeBind.fromJson(Map<String, dynamic> json) => SafeBind(
    card: json["card"],
    code: json["code"],
    team: json["team"],
  );

  Map<String, dynamic> toJson() => {
    "card": card,
    "code": code,
    "team": team,
  };
}