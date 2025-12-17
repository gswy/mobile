import 'dart:convert';

import 'package:hive_ce/hive.dart';

part 'news.g.dart';

/// 消息列表
@HiveType(typeId: 5)
class News {

  /// 消息标识
  @HiveField(0)
  final String id;

  /// 是否已读
  @HiveField(1)
  final bool read;

  /// 消息类型
  @HiveField(2)
  final String type;

  /// 消息标题
  @HiveField(3)
  final String title;

  /// 消息描述
  @HiveField(4)
  final String message;

  /// 消息载荷
  @HiveField(5)
  final String payload;

  /// 消息时间
  @HiveField(6)
  final int sourcedAt;

  /// 构造函数
  News({
    required this.id,
    required this.read,
    required this.type,
    required this.title,
    required this.message,
    required this.payload,
    required this.sourcedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    read: false,
    type: json["type"],
    title: json["title"],
    message: json["message"],
    payload: jsonEncode(json["payload"]),
    sourcedAt: json["sourcedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "read": read,
    "type": type,
    "title": title,
    "message": message,
    "payload": payload,
    "sourcedAt": sourcedAt,
  };
}