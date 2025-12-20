import 'package:app/cores/drift/enums/chat_type_enum.dart';

/// 会话字段
class Chat {
  final int id;
  final ChatTypeEnum type;
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

/// 会话详情
class ChatInfo {
  /// 会话标识
  final int id;

  /// 会话类型
  final ChatTypeEnum type;

  /// 会话名称
  final String name;

  /// 会话头像
  final String avatar;

  /// 发起标识
  final int sourceId;

  /// 目标标识
  final int targetId;

  /// 创建时间
  final int createdAt;

  /// 消息时间
  final int updatedAt;

  ChatInfo({
    required this.id,
    required this.type,
    required this.name,
    required this.avatar,
    required this.sourceId,
    required this.targetId,
    required this.createdAt,
    required this.updatedAt,
  });
}

/// 会话列表
class ChatList {
  /// 会话标识
  final int id;

  /// 会话类型
  final ChatTypeEnum type;

  /// 会话名称
  final String name;

  /// 会话头像
  final String? avatar;

  /// 消息内容
  final String content;

  /// 未读数量
  final int unread;

  /// 消息时间
  final int updatedAt;

  ChatList({
    required this.id,
    required this.type,
    required this.name,
    required this.avatar,
    required this.unread,
    required this.content,
    required this.updatedAt,
  });
}
