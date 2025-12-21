

import 'package:app/cores/drift/enums/chat_type.dart';

/// 会话字段
class Chat {
  final int id;
  final ChatType type;
  final int sourceId;
  final int targetId;
  final int unread;
  final String content;
  final int createdAt;
  final int updatedAt;

  Chat({
    required this.id,
    required this.type,
    required this.sourceId,
    required this.targetId,
    required this.unread,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}

/// 会话列表
class ChatList {
  /// 会话标识
  final int id;

  /// 会话类型
  final ChatType type;

  /// 会话名称
  final String title;

  /// 会话头像
  final String? avatar;

  /// 未读数量
  final int unread;

  /// 消息内容
  final String message;

  /// 消息时间
  final int messageAt;

  ChatList({
    required this.id,
    required this.type,
    required this.title,
    required this.avatar,
    required this.unread,
    required this.message,
    required this.messageAt,
  });


  /// json转换
  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    avatar: json["avatar"],
    unread: 1,
    message: json["message"],
    messageAt: json["messageAt"],
  );
}

/// 消息列表
class InfoList {

}
