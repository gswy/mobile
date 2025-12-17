import 'package:hive_ce/hive.dart';

part 'mate.g.dart';

/// 好友列表
@HiveType(typeId: 3)
class Mate {

  /// 好友ID
  @HiveField(0)
  final int id;

  /// 好友头像
  @HiveField(1)
  final String? avatar;

  /// 好友昵称
  @HiveField(2)
  final String nickname;

  /// 好友账号
  @HiveField(3)
  final String username;

  /// 构造函数
  Mate({
    required this.id,
    this.avatar,
    required this.nickname,
    required this.username,
  });

  factory Mate.fromJson(dynamic json) => Mate(
    id: json["id"],
    avatar: json["avatar"],
    nickname: json["nickname"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "avatar": avatar,
    "nickname": nickname,
    "username": username,
  };

}
