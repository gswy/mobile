
import 'package:app/cores/drift/enums/role_type.dart';
import 'package:drift/drift.dart';

/// 群组管理
class TeamsTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'teams';

  /// 群组标识
  IntColumn get id => integer()();

  /// 群组名称
  TextColumn get name => text()();

  /// 群组头像
  TextColumn get avatar => text().nullable()();

  /// 群组所属: 对应`users`用户标识
  IntColumn get currentId => integer()();

  /// 设置主键：与服务端保持一致
  @override
  Set<Column> get primaryKey => {id};
}

/// 群组人员
class TeamsUsersTable extends Table {

  /// 设置表名
  @override
  String get tableName => 'teams_users';

  /// 主键标识：对应服务端的关联标识
  IntColumn get id => integer()();

  /// 群组标识
  IntColumn get teamId => integer()();

  /// 成员标识
  IntColumn get userId => integer()();

  /// 成员角色
  IntColumn get role => intEnum<RoleType>()();

  /// 群员头像
  TextColumn get avatar => text()();

  /// 群员昵称
  TextColumn get nickname => text()();

  /// 加入时间
  IntColumn get createdAt => integer()();

  /// 修改时间
  IntColumn get updatedAt => integer().nullable()();

  /// 设置主键：与服务端保持一致
  @override
  Set<Column> get primaryKey => {id};

}