
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:drift/drift.dart';

/// 消息管理
class InfosTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'infos';

  /// 消息标识（云端）
  IntColumn get id => integer().nullable()();

  /// 会话标识
  TextColumn get sn => text()();

  /// 消息标识（本地）
  TextColumn get clientId => text()();

  /// 消息类型
  IntColumn get type => intEnum<InfoType>()();

  /// 发送用户
  IntColumn get userId => integer()();

  /// 发送头像
  TextColumn get avatar => text().nullable()();

  /// 发送昵称
  TextColumn get nickname => text()();

  /// 会话未读
  BoolColumn get unread => boolean()();

  /// 消息状态
  IntColumn get status => integer()();

  /// 消息内容
  TextColumn get message => text()();

  /// 最后时间
  IntColumn get messageAt => integer()();

  @override
  Set<Column> get primaryKey => {clientId};

}
