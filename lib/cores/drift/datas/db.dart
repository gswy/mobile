
import 'package:app/cores/drift/datas/drift_datas.dart';
import 'package:app/cores/drift/datas/drift_model.dart';
import 'package:app/cores/drift/enums/chat_type.dart';

import 'package:drift/drift.dart';

/// 全局单例数据库操作
class DB {
  DB._();

  static final DB _instance = DB._();

  static DriftDatas get _db => _instance._database;

  late final DriftDatas _database = DriftDatas();

  static final dao = DriftModel(_db);

  static void test() {
    Future.delayed(const Duration(seconds: 60), () async {
      await _db.transaction(() async {
        // ========= 1) users（目标用户） =========
        await DB.dao.into(DB.dao.usersTable).insertOnConflictUpdate(
          UsersTableCompanion.insert(
            id: const Value(200),
            username: 'user200',
            nickname: '小明',
            avatar: const Value(null),
            phone: const Value(null),
            email: const Value(null),
            createdAt: 1766230914000,
          ),
        );

        await DB.dao.into(DB.dao.usersTable).insertOnConflictUpdate(
          UsersTableCompanion.insert(
            id: const Value(300),
            username: 'user300',
            nickname: '小红',
            avatar: const Value(null),
            phone: const Value(null),
            email: const Value(null),
            createdAt: 1766230914000,
          ),
        );

        // ========= 2) mates（当前用户=100 的好友关系） =========
        await DB.dao.into(DB.dao.matesTable).insertOnConflictUpdate(
          MatesTableCompanion.insert(
            id: const Value(9001),
            nickname: '小明(备注)',
            sourceId: 100,
            // 当前用户
            targetId: 200,
            // 目标用户 -> users.id=200
            createdAt: 1766230914100,
          ),
        );

        await DB.dao.into(DB.dao.matesTable).insertOnConflictUpdate(
          MatesTableCompanion.insert(
            id: const Value(9002),
            nickname: '小红(备注)',
            sourceId: 100,
            targetId: 300,
            createdAt: 1766230914200,
          ),
        );

        // ========= 3) teams（归属当前用户=100） =========
        await DB.dao.into(DB.dao.teamsTable).insertOnConflictUpdate(
          TeamsTableCompanion.insert(
            id: const Value(7001),
            name: '测试群 A',
            avatar: const Value(null),
            currentId: 100,
          ),
        );

        await DB.dao.into(DB.dao.teamsTable).insertOnConflictUpdate(
          TeamsTableCompanion.insert(
            id: const Value(7002),
            name: '测试群 B',
            avatar: const Value(null),
            currentId: 100,
          ),
        );

        // ========= 4) chats =========
        // 关键：你 selectChatList 里是用 chats.sourceId/targetId 去 join mates.id / teams.id
        // 所以 mate 会话这里要写 mates.id（9001/9002），team 会话写 teams.id（7001/7002）
        await DB.dao.insertChat(
          ChatsTableCompanion.insert(
            type: ChatType.mate,
            sourceId: 9001,
            targetId: 9001,
            unread: const Value(1),
            content: '和小明的最后一条消息',
            updatedAt: const Value(1766230915000),
            createdAt: const Value(1766230915000),
          ),
        );

        await DB.dao.insertChat(
          ChatsTableCompanion.insert(
            type: ChatType.mate,
            sourceId: 9002,
            targetId: 9002,
            unread: const Value(3),
            content: '和小红的最后一条消息',
            updatedAt: const Value(1766230916000),
            createdAt: const Value(1766230916000),
          ),
        );

        await DB.dao.insertChat(
          ChatsTableCompanion.insert(
            type: ChatType.team,
            sourceId: 7001,
            targetId: 7001,
            unread: const Value(9),
            content: '测试群A：最后一条群消息',
            updatedAt: const Value(1766230917000),
            createdAt: const Value(1766230917000),
          ),
        );

        await DB.dao.insertChat(
          ChatsTableCompanion.insert(
            type: ChatType.team,
            sourceId: 7002,
            targetId: 7002,
            unread: const Value(0),
            content: '测试群B：最后一条群消息',
            updatedAt: const Value(1766230913000),
            createdAt: const Value(1766230913000),
          ),
        );
      });
    });
  }

}