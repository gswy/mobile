import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:drift/drift.dart';

/// 会话管理
class ChatsTable extends Table {
  /// 设置表名
  @override
  String get tableName => 'chats';

  /// 会话标识
  TextColumn get sn => text()();

  /// 自增标识
  IntColumn  get id => integer().nullable()();

  /// 会话类型
  IntColumn get type => intEnum<ChatType>()();

  /// 我的标识
  IntColumn get sourceId => integer()();

  /// 对方标识
  IntColumn get targetId => integer()();

  /// 对方名称
  TextColumn get title => text()();

  /// 对方头像: 可为空头像
  TextColumn get logo => text().nullable()();

  /// 会话未读
  IntColumn get unread => integer().withDefault(const Constant(0))();

  /// 消息内容
  TextColumn get message => text()();

  /// 最后时间
  IntColumn get messageAt => integer()();

  /// 唯一标识
  @override
  Set<Column> get primaryKey => {sn};
}
