
import 'package:drift/drift.dart';

/// 我的信息：登录用户
class MinesTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'mines';

  /// 我的标识
  IntColumn get id => integer()();

  /// 我的头像
  TextColumn get avatar => text().nullable()();

  /// 我的账号
  TextColumn get username => text()();

  /// 我的密码
  TextColumn get nickname => text()();

  /// 登录时间
  IntColumn get createdAt => integer()();

  /// 修改时间
  IntColumn get updatedAt => integer().nullable()();

  /// 设置主键：与服务端保持一致
  @override
  Set<Column> get primaryKey => {id};

}