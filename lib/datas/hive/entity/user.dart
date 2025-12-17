import 'package:hive_ce/hive.dart';

part 'user.g.dart';

/// 群组用户
@HiveType(typeId: 7)
class User {

  /// 群组ID
  @HiveField(0)
  final int id;

  /// 所属群组
  @HiveField(1)
  final int teamId;

  /// 群组名称
  @HiveField(2)
  final String nickname;

  /// 群组头像
  @HiveField(3)
  final String? avatar;

  /// 构造函数
  User({required this.id, required this.teamId, required this.nickname, this.avatar});

  factory User.fromJson(dynamic json) => User(
    id: json["id"],
    teamId: json["teamId"],
    nickname: json["nickname"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "teamId": teamId,
    "nickname": nickname,
    "avatar": avatar,
  };

}