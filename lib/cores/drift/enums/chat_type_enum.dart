import 'package:drift/drift.dart';

/// 会话类型
enum ChatTypeEnum {
  /// 好友
  mate(0),

  /// 群组
  team(1);

  /// 代码定义
  final int code;

  /// 构造函数
  const ChatTypeEnum(this.code);

  /// 数字转枚举
  static ChatTypeEnum fromCode(int code) {
    return ChatTypeEnum.values.firstWhere(
      (it) => it.code == code,
      orElse: () => ChatTypeEnum.mate,
    );
  }
}

/// 会话枚举转换
class ChatTypeEnumConverter extends TypeConverter<ChatTypeEnum, int> {
  const ChatTypeEnumConverter();

  @override
  ChatTypeEnum fromSql(int fromDb) => ChatTypeEnum.fromCode(fromDb);

  @override
  int toSql(ChatTypeEnum value) => value.code;
}
