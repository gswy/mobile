import 'package:app/cores/drift/enums/info_type.dart';

/// 消息列表
class Info {
  /// 消息标识（云端）
  int? id;

  /// 消息标识（本地）
  String clientId;

  /// 消息类型
  InfoType type;

  /// 会话标识
  int chatId;

  /// 发送标识
  int userId;

  /// 发送头像
  String? avatar;

  /// 发送昵称
  String nickname;

  /// 未读消息
  bool unread;

  /// 发送结果
  int status;

  /// 消息内容
  String message;

  /// 消息时间
  int messageAt;

  /// 消息构造
  Info({
    this.id,
    required this.clientId,
    required this.type,
    required this.chatId,
    required this.userId,
    required this.avatar,
    required this.nickname,
    required this.unread,
    required this.status,
    required this.message,
    required this.messageAt,
  });




}
