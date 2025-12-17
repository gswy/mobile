import 'package:hive_ce/hive.dart';

part 'mine.g.dart';

/// 我的列表
@HiveType(typeId: 4)
class Mine {
  /// 我的ID
  @HiveField(0)
  final int id;

  /// 我的名称
  @HiveField(1)
  final String nickname;

  /// 我的名称
  @HiveField(2)
  final String username;

  /// 我的名称
  @HiveField(3)
  final String? phone;

  /// 我的名称
  @HiveField(4)
  final String? email;

  /// 我的头像
  @HiveField(5)
  final String? avatar;

  /// 构造函数
  Mine({
    required this.id,
    required this.nickname,
    required this.username,
    this.phone,
    this.email,
    this.avatar,
  });

  /// JSON转换
  factory Mine.fromJson(dynamic json) => Mine(
    id: json["id"],
    nickname: json["nickname"],
    username: json["username"],
    phone: json["phone"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nickname": nickname,
    "username": username,
    "phone": phone,
    "email": email,
    "avatar": avatar,
  };

}
