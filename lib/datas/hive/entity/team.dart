import 'package:hive_ce/hive.dart';

part 'team.g.dart';

/// 群组列表
@HiveType(typeId: 6)
class Team {

  /// 群组ID
  @HiveField(0)
  final int id;

  /// 群组名称
  @HiveField(1)
  final String name;

  /// 群组头像
  @HiveField(2)
  final String? avatar;

  /// 群组群主
  @HiveField(3)
  final int currentId;

  /// 构造函数
  Team({required this.id, required this.name, required this.avatar, required this.currentId});

  factory Team.fromJson(dynamic json) => Team(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    currentId: json["currentId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "currentId": currentId,
  };

}