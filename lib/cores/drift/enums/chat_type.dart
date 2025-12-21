import 'package:drift/drift.dart';

/// 会话类型
enum ChatType {
  /// 好友
  mate(0),

  /// 群组
  team(1);

  /// 代码定义
  final int code;

  /// 构造函数
  const ChatType(this.code);

  /// 数字转枚举
  static ChatType fromCode(int code) {
    return ChatType.values.firstWhere(
      (it) => it.code == code,
      orElse: () => ChatType.mate,
    );
  }
}

/// 会话枚举转换
class ChatTypeEnumConverter extends TypeConverter<ChatType, int> {
  const ChatTypeEnumConverter();

  @override
  ChatType fromSql(int fromDb) => ChatType.fromCode(fromDb);

  @override
  int toSql(ChatType value) => value.code;
}
