
import 'package:app/cores/drift/enums/chat_type_enum.dart';
import 'package:app/cores/drift/enums/info_type_enum.dart';
import 'package:drift/drift.dart';

/// 会话管理
class ChatsTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'chats';

  /// 会话标识
  IntColumn get id => integer().autoIncrement()();

  /// 会话类型
  IntColumn get type => intEnum<ChatTypeEnum>()();

  /// 会话发起：用户标识/群组标识
  IntColumn get sourceId => integer()();

  /// 会话接收：用户标识/群组标识
  IntColumn get targetId => integer()();

  /// 会话未读
  IntColumn get unread => integer().withDefault(const Constant(0))();

  /// 消息内容
  TextColumn get content => text()();

  /// 创建时间：会话创建
  IntColumn get createdAt => integer()
      .clientDefault(() => DateTime.now().millisecondsSinceEpoch)();

  /// 修改时间：最后消息
  IntColumn get updatedAt => integer().nullable()();

}

/// 消息管理
class ChatsInfosTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'chats_infos';

  /// 消息标识
  IntColumn get id => integer().autoIncrement()();

  /// 所属会话
  IntColumn get chatId => integer()();

  /// 消息类型
  IntColumn get type => intEnum<InfoTypeEnum>()();

  /// 发送人员
  IntColumn get sourceId => integer()();

  /// 接收人员
  IntColumn get targetId => integer()();

  /// 消息内容
  TextColumn get content => text()();

  /// 消息未读
  BoolColumn get unread => boolean().withDefault(const Constant(true))();

  /// 发送时间
  IntColumn get sourcedAt => integer()();

  /// 接收时间
  IntColumn get createdAt => integer().nullable()();

  /// 修改时间
  IntColumn get updatedAt => integer().nullable()();


}