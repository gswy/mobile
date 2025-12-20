import 'package:app/cores/drift/enums/chat_type_enum.dart';
import 'package:app/cores/drift/enums/info_type_enum.dart';
import 'package:app/cores/drift/enums/user_role_enum.dart';

import 'package:app/cores/drift/datas/drift_datas.dart';
import 'package:app/cores/drift/table/chats_table.dart';
import 'package:app/cores/drift/table/mates_table.dart';
import 'package:app/cores/drift/table/mines_table.dart';
import 'package:app/cores/drift/table/teams_table.dart';
import 'package:app/cores/drift/table/users_table.dart';
import 'package:app/cores/model/chat.dart';
import 'package:drift/drift.dart';

part 'drift_model.g.dart';

/// 数据库访问层（DAO）
@DriftAccessor(
  tables: [
    ChatsTable,
    ChatsInfosTable,
    MatesTable,
    MinesTable,
    TeamsTable,
    TeamsUsersTable,
    UsersTable,
  ],
)
class DriftModel extends DatabaseAccessor<DriftDatas> with _$DriftModelMixin {
  DriftModel(super.db);

  /// ==========================================================================
  /// 用户操作
  /// ==========================================================================

  /// 插入用户
  Future<int> insertUser(UsersTableCompanion info) async {
    return into(usersTable).insert(info);
  }

  /// 批量插入
  // Future<bool> insertUserList(List<UserInfo> lists) async {
  //
  // }

  /// 查询详情
  // Future<UserInfo> selectUser(int id) async {
  //
  // }

  /// ==========================================================================
  /// 好友操作
  /// ==========================================================================

  /// 插入好友
  Future<int> insertMate(MatesTableCompanion info) async {
    return into(matesTable).insert(info);
  }

  /// 查询好友

  /// 修改好友：全量修改
  Future<bool> updateMate(MatesTableCompanion info) async {
    return update(matesTable).replace(info);
  }

  /// 批量插入：
  // Future<bool> insertMateList(List<MateInfo> lists) async {
  //
  // }

  // /// 好友分页
  // Future<Page<MateInfo>> selectMateList() async {
  //
  // }

  /// ==========================================================================
  /// 群组操作
  /// ==========================================================================

  /// 插入群组
  Future<int> insertTeam(TeamsTableCompanion info) async {
    return into(teamsTable).insert(info);
  }

  // /// 查询群组详情：
  // Future<TeamInfo> selectTeam(int id) async {
  //
  // }

  /// 查询群组分页
  /// [userId] 代表当前登录用户，[page] 代表当前当前第几页
  // Future<Page<TeamList>> selectTeamList(int userId, int page) async {
  //
  // }

  /// ==========================================================================
  /// 会话操作
  /// ==========================================================================

  /// 插入会话：
  Future<int> insertChat(ChatsTableCompanion data) async {
    return into(chatsTable).insert(data);
  }

  // /// 会话详情
  // Future<ChatInfo> selectChat(int id) async {
  //
  // }

  /// 会话未读
  Stream<int> selectChatUnread(int userId) {
    /// 会话表信息
    final c = chatsTable;

    /// SUM(unread)
    final sumUnread = c.unread.sum();

    /// 查询数量
    final q = selectOnly(c)
      ..addColumns([sumUnread])
      ..where(c.sourceId.equals(userId) | c.targetId.equals(userId));

    /// 响应处理
    return q.watchSingle().map((row) => row.read(sumUnread) ?? 0);
  }

  /// 会话列表：
  Stream<List<ChatList>> selectChatList(int currentUserId) {
    final c = chatsTable;

    // alias：同表 join 两次
    final tSource = alias(teamsTable, 't_source');
    final tTarget = alias(teamsTable, 't_target');

    final mSource = alias(matesTable, 'm_source');
    final mTarget = alias(matesTable, 'm_target');

    final uFromSourceMate = alias(usersTable, 'u_from_source_mate');
    final uFromTargetMate = alias(usersTable, 'u_from_target_mate');

    // 排序：updatedAt desc，null 用 createdAt 兜底
    final base = select(c)
      ..orderBy([
            (t) => OrderingTerm.desc(t.updatedAt),
            (t) => OrderingTerm.desc(t.createdAt),
      ]);

    final joined = base.join([
      // team：source/target -> teams.id
      leftOuterJoin(tSource, tSource.id.equalsExp(c.sourceId)),
      leftOuterJoin(tTarget, tTarget.id.equalsExp(c.targetId)),

      // mate：source/target -> mates.id
      leftOuterJoin(mSource, mSource.id.equalsExp(c.sourceId)),
      leftOuterJoin(mTarget, mTarget.id.equalsExp(c.targetId)),

      // mate -> users：用 mates.targetId 指向 users.id（目标用户）
      leftOuterJoin(uFromSourceMate, uFromSourceMate.id.equalsExp(mSource.targetId)),
      leftOuterJoin(uFromTargetMate, uFromTargetMate.id.equalsExp(mTarget.targetId)),
    ])
    // ✅ 与我有关的过滤
      ..where(
        (c.type.equals(ChatTypeEnum.team.code) &
        (tSource.currentId.equals(currentUserId) |
        tTarget.currentId.equals(currentUserId))) |
        (c.type.equals(ChatTypeEnum.team.code) &
        (mSource.sourceId.equals(currentUserId) |
        mTarget.sourceId.equals(currentUserId))),
      );

    return joined.watch().map((rows) {
      return rows.map((row) {
        final chat = row.readTable(c);
        final updatedAt = chat.updatedAt ?? chat.createdAt;

        String name = '';
        String? avatar;

        if (chat.type == ChatTypeEnum.team) {
          final team = row.readTableOrNull(tSource) ?? row.readTableOrNull(tTarget);
          name = team?.name ?? '';
          avatar = team?.avatar;
        } else if (chat.type == ChatTypeEnum.mate) {
          final mate = row.readTableOrNull(mSource) ?? row.readTableOrNull(mTarget);
          final user = row.readTableOrNull(uFromSourceMate) ?? row.readTableOrNull(uFromTargetMate);

          // 名称：优先 users.nickname，其次 mates.nickname
          name = user?.nickname ?? mate?.nickname ?? '';

          // 头像：优先 users.avatar
          avatar = user?.avatar;
        }

        return ChatList(
          id: chat.id,
          type: chat.type,
          name: name,
          avatar: avatar,
          content: chat.content,
          unread: chat.unread,
          updatedAt: updatedAt,
        );
      }).toList();
    });
  }

  /// ==========================================================================
  /// 消息操作
  /// ==========================================================================

  /// 插入消息
  Future<int> insertChatInfo(ChatsInfosTableCompanion data) async {
    return into(chatsInfosTable).insert(data);
  }

  // /// 消息列表：包含用户头像、用户昵称，消息类型，消息内容；
  // Future<Page<ChatInfo>> selectChatInfoList() async {
  //
  // }
}
