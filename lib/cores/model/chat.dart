
import 'package:app/cores/drift/enums/chat_type.dart';

/// 会话列表
class Chat {
  /// 会话标识
  final int id;

  /// 会话类型
  final ChatType type;

  /// 对方标识
  final int targetId;

  /// 我的标识
  final int sourceId;

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

  Chat({
    required this.id,
    required this.type,
    required this.targetId,
    required this.sourceId,
    required this.title,
    required this.avatar,
    required this.unread,
    required this.message,
    required this.messageAt,
  });


  /// json转换
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    type: ChatType.fromCode(json["type"]),
    targetId: json["targetId"],
    sourceId: json["sourceId"],
    title: json["title"],
    avatar: json["avatar"],
    unread: 1,
    message: json["message"],
    messageAt: json["messageAt"],
  );
}

