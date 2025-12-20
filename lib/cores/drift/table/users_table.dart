
import 'package:drift/drift.dart';

/// 用户管理
class UsersTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'users';

  /// 用户标识
  IntColumn get id => integer()();

  /// 用户头像
  TextColumn get avatar => text().nullable()();

  /// 用户账号
  TextColumn get username => text()();

  /// 用户昵称
  TextColumn get nickname => text()();

  /// 用户手机
  TextColumn get phone => text().nullable()();

  /// 用户邮箱
  TextColumn get email => text().nullable()();

  /// 注册时间
  IntColumn get createdAt => integer()();

  /// 设置主键：与服务端保持一致
  @override
  Set<Column> get primaryKey => {id};

}

