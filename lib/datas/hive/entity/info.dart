import 'dart:convert';

import 'package:hive_ce/hive.dart';

part 'info.g.dart';

/// 消息列表
@HiveType(typeId: 2)
class Info {

  /// 消息ID
  @HiveField(0)
  int? id;

  /// 房间类型(0好友，1群组)
  @HiveField(2)
  int mode;

  /// 消息来源
  @HiveField(3)
  int sourceId;

  /// 消息目标
  @HiveField(4)
  int targetId;

  /// 消息类型
  @HiveField(5)
  int type;

  /// 消息状态
  @HiveField(6)
  int status;

  /// 消息内容
  @HiveField(7)
  String content;

  /// 发送时间
  @HiveField(8)
  int sourcedAt;

  /// 构造函数
  Info({
    this.id,
    required this.mode,
    required this.sourceId,
    required this.targetId,
    required this.status,
    required this.type,
    required this.content,
    required this.sourcedAt,
  });

  factory Info.fromJson(String json) {
    final res = jsonDecode(json);
    final sourcedAt = DateTime
        .parse(res['sourcedAt'])
        .millisecondsSinceEpoch;
    return Info(
      id: res['id'],
      mode: res['mode'],
      sourceId: res['sourceId'],
      targetId: res['targetId'],
      status: 1,
      type: res['type'],
      content: res['content'],
      sourcedAt: sourcedAt,
    );
  }

}
