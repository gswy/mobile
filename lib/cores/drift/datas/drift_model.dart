import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/cores/drift/enums/role_type.dart';

import 'package:app/cores/drift/datas/drift_datas.dart';
import 'package:app/cores/drift/table/chats_table.dart';
import 'package:app/cores/drift/table/mates_table.dart';
import 'package:app/cores/drift/table/mines_table.dart';
import 'package:app/cores/drift/table/teams_table.dart';
import 'package:app/cores/drift/table/users_table.dart';
import 'package:app/cores/model/chat.dart';
import 'package:app/cores/model/mate.dart';
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
  /// 插入好友列表（业务）
  // Future<void> saveMateList(List<MateList> lists) async {
  //   /// 批量入库好友
  //   await batch((b) {
  //     final mates = lists.map((mate) => MatesTableCompanion(
  //         id: Value(mate.id),
  //         nickname: Value(mate.nickname),
  //         sourceId: Value(mate.sourceId),
  //         targetId: Value(mate.targetId),
  //         createdAt: Value(mate.createdAt)
  //     )).toList();
  //     b.insertAllOnConflictUpdate(matesTable, mates);
  //   });
  //   /// 批量入库用户
  //   await batch((b) {
  //     final users = lists.map((mate) => UsersTableCompanion(
  //         id: Value(mate.user.id),
  //         avatar: Value(mate.user.avatar),
  //         nickname: Value(mate.user.nickname),
  //         username: Value(mate.user.username),
  //         phone: Value(mate.user.phone),
  //         email: Value(mate.user.email),
  //         createdAt: Value(mate.user.createdAt)
  //     )).toList();
  //     b.insertAllOnConflictUpdate(usersTable, users);
  //   });
  // }

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

  /// 好友分页
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
  // Stream<List<ChatList>> selectChatList(int currentUserId) {
  //   return
  // }

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
