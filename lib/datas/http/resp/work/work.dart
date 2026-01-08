
class Work {
  final String? logo;
  final Firm firm;
  final Stat stat;
  Work({required this.logo, required this.firm, required this.stat});

  factory Work.fromJson(dynamic json) => Work(
    logo: json["logo"],
    firm: Firm.fromJson(json["firm"]),
    stat: Stat.fromJson(json['stat']),
  );
}

class Firm {
  final String name;
  final String desc;
  final String host;
  Firm({required this.name, required this.desc, required this.host});

  factory Firm.fromJson(dynamic json) => Firm(
    name: json["name"],
    desc: json["desc"],
    host: json["host"],
  );
}

class Stat {
  final int users;
  final int admin;
  final int lines;
  final int tasks;
  Stat({required this.users, required this.admin, required this.lines, required this.tasks});

  factory Stat.fromJson(dynamic json) => Stat(
    users: json["users"],
    admin: json["admin"],
    lines: json["lines"],
    tasks: json["tasks"],
  );


}
