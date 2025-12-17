import 'package:hive_ce/hive.dart';

part 'chat.g.dart';

/// 会话列表
@HiveType(typeId: 1)
class Chat {
  /// 对方ID
  @HiveField(0)
  final int id;

  /// 会话类型(0好友，1群组)
  @HiveField(1)
  final int mode;

  /// 聊天名称
  @HiveField(2)
  final String name;

  /// 聊天头像
  @HiveField(3)
  final String? avatar;

  /// 最后消息
  @HiveField(4)
  final String? content;

  /// 消息类型
  @HiveField(5)
  final int? type;

  /// 最后聊天时间
  @HiveField(6)
  final String? lastedAt;

  /// 构造函数
  Chat({
    required this.id,
    required this.mode,
    required this.name,
    this.avatar,
    this.content,
    this.type,
    this.lastedAt,
  });
}
