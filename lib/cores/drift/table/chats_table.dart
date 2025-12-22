import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:drift/drift.dart';

/// 会话管理
class ChatsTable extends Table {
  /// 设置表名
  @override
  String get tableName => 'chats';

  /// 消息标识
  IntColumn get id => integer()();

  /// 会话类型
  IntColumn get type => intEnum<ChatType>()();

  /// 我的标识
  IntColumn get sourceId => integer()();

  /// 对方标识
  IntColumn get targetId => integer()();

  /// 对方名称
  TextColumn get title => text()();

  /// 对方头像: 可为空头像
  TextColumn get avatar => text().nullable()();

  /// 会话未读
  IntColumn get unread => integer().withDefault(const Constant(0))();

  /// 消息内容
  TextColumn get message => text()();

  /// 最后时间
  IntColumn get messageAt => integer()();
}
