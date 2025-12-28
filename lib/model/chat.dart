
import 'package:app/cores/drift/enums/chat_type.dart';

/// 会话列表
class Chat {

  /// 自增标识
  int? id;

  /// 会话标识
  String sn;

  /// 会话类型
  ChatType type;

  /// 对方标识
  int targetId;

  /// 我的标识
  int sourceId;

  /// 会话名称
  String title;

  /// 会话头像
  String? avatar;

  /// 未读数量
  int unread;

  /// 消息内容
  String message;

  /// 消息时间
  int messageAt;

  Chat({
    required this.id,
    required this.sn,
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
    id: json['id'],
    sn: json['sn'],
    type: ChatType.fromCode(json['type']),
    targetId: json['targetId'],
    sourceId: json['sourceId'],
    title: json['title'],
    avatar: json['avatar'],
    unread: json['unread'],
    message: json['message'],
    messageAt: json['messageAt'],
  );
}

