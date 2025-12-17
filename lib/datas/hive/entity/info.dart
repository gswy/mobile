import 'package:hive_ce/hive.dart';

part 'info.g.dart';

/// 消息列表
@HiveType(typeId: 2)
class Info {

  /// 消息ID
  @HiveField(0)
  final int? id;

  /// 房间类型(0好友，1群组)
  @HiveField(2)
  final int mode;

  /// 消息来源
  @HiveField(3)
  final int sourceId;

  /// 消息目标
  @HiveField(4)
  final int targetId;

  /// 消息类型
  @HiveField(5)
  final int type;

  /// 消息状态
  @HiveField(6)
  final int status;

  /// 消息内容
  @HiveField(7)
  final String content;

  /// 发送时间
  @HiveField(8)
  final int createdAt;

  /// 构造函数
  Info({
    required this.id,
    required this.mode,
    required this.sourceId,
    required this.targetId,
    required this.status,
    required this.type,
    required this.content,
    required this.createdAt,
  });

  /// 拷贝并修改部分字段
  Info copyWith({
    int? id,
    int? mode,
    int? sourceId,
    int? targetId,
    int? type,
    int? status,
    String? content,
    int? createdAt,
  }) {
    return Info(
      id: id ?? this.id,
      mode: mode ?? this.mode,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      type: type ?? this.type,
      status: status ?? this.status,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}
