import 'dart:io';

import 'package:app/cores/drift/datas/drift_model.dart';
import 'package:app/cores/drift/enums/chat_type_enum.dart';
import 'package:app/cores/drift/enums/info_type_enum.dart';
import 'package:app/cores/drift/enums/user_role_enum.dart';

import 'package:app/cores/drift/table/chats_table.dart';
import 'package:app/cores/drift/table/mates_table.dart';
import 'package:app/cores/drift/table/mines_table.dart';
import 'package:app/cores/drift/table/teams_table.dart';
import 'package:app/cores/drift/table/users_table.dart';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'drift_datas.g.dart';

@DriftDatabase(
  tables: [
    ChatsTable,
    ChatsInfosTable,
    MatesTable,
    MinesTable,
    TeamsTable,
    TeamsUsersTable,
    UsersTable,
  ],
  daos: [
    DriftModel
  ]
)
class DriftDatas extends _$DriftDatas {
  DriftDatas() : super(_executor());

  @override
  int get schemaVersion => 1;

  /// 数据库迁移操作
  @override
  MigrationStrategy get migration => MigrationStrategy(
    /// 创建操作
    onCreate: (Migrator m) async {
      /// 自动创建所有表
      await m.createAll();
    },
    /// 数据迁移
    onUpgrade: (Migrator m, int from, int to) async {}
  );

  /// 数据库配置地址
  static QueryExecutor _executor() {
    return driftDatabase(
      name: 'chat',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory
      )
    );
  }

}