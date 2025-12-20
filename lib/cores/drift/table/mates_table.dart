
import 'package:drift/drift.dart';

/// 好友管理
class MatesTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'mates';

  /// 好友标识
  IntColumn get id => integer()();

  /// 目标昵称
  TextColumn get nickname => text()();

  /// 当前用户
  IntColumn get sourceId => integer()();

  /// 目标用户
  IntColumn get targetId => integer()();

  /// 添加时间
  IntColumn get createdAt => integer()();

  /// 设置主键：与服务端保持一致
  @override
  Set<Column> get primaryKey => {id};


}