
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/cores/drift/enums/role_type.dart';

import 'package:app/cores/drift/datas/drift_datas.dart';
import 'package:app/cores/drift/table/chats_table.dart';
import 'package:app/cores/drift/table/infos_table.dart';
import 'package:app/model/chat.dart';
import 'package:app/model/info.dart';
import 'package:drift/drift.dart';

part 'drift_model.g.dart';

/// 数据库访问层（DAO）
@DriftAccessor(tables: [ChatsTable, InfosTable])
class DriftModel extends DatabaseAccessor<DriftDatas> with _$DriftModelMixin {
  DriftModel(super.db);

  /// ==========================================================================
  /// 会话操作
  /// ==========================================================================

  /// 插入会话：
  Future<int> saveChat(Chat chat) async {
    final data = ChatsTableCompanion.insert(
      sn: chat.sn,
      id: Value(chat.id),
      type: chat.type,
      avatar: Value(chat.avatar),
      sourceId: chat.sourceId,
      targetId: chat.targetId,
      title: chat.title,
      message: chat.message,
      messageAt: chat.messageAt,
    );
    return await into(chatsTable).insertOnConflictUpdate(data);
  }

  /// 会话已读
  Future<int> readChat(String sn) async {
    return (update(chatsTable)..where((t) => t.sn.equals(sn)))
        .write(const ChatsTableCompanion(unread: Value(0)));
  }

  /// 批量插入:
  Future<void> saveChatList(List<Chat> chats) async {
    final lists = chats
        .map(
          (chat) => ChatsTableCompanion.insert(
            sn: chat.sn,
            id: Value(chat.id),
            type: chat.type,
            avatar: Value(chat.avatar),
            sourceId: chat.sourceId,
            targetId: chat.targetId,
            title: chat.title,
            unread: Value(chat.unread),
            message: chat.message,
            messageAt: chat.messageAt,
          ),
        )
        .toList();
    return await batch((bt) {
      bt.insertAllOnConflictUpdate(chatsTable, lists);
    });
  }

  /// 查找会话
  Future<Chat?> findChat(String sn) async {
    final c = chatsTable;
    final chat = await (select(
      c,
    )..where((t) => t.sn.equals(sn))).getSingleOrNull();
    if (chat == null) return null;
    return Chat(
      sn: chat.sn,
      id: chat.id,
      type: chat.type,
      targetId: chat.targetId,
      sourceId: chat.sourceId,
      title: chat.title,
      avatar: chat.avatar,
      unread: chat.unread,
      message: chat.message,
      messageAt: chat.messageAt,
    );
  }

  /// 会话未读
  Stream<int> selectChatUnread(int sourceId) {
    final c = chatsTable;
    final sumUnread = c.unread.sum();
    final q = selectOnly(c)
      ..addColumns([sumUnread])
      ..where(c.sourceId.equals(sourceId) & c.unread.isBiggerThanValue(0));
    return q.watchSingle().map((row) => row.read(sumUnread) ?? 0);
  }

  /// 会话列表：
  /// 监听变化
  Stream<List<Chat>> listChat(int userId) {
    final c = chatsTable;
    final query = (select(c)..orderBy([(t) => OrderingTerm.desc(t.messageAt)]));
    return query.watch().map((rows) {
      return rows
          .map(
            (it) => Chat(
              id: it.id,
              sn: it.sn,
              type: it.type,
              targetId: it.targetId,
              sourceId: it.sourceId,
              title: it.title,
              avatar: it.avatar,
              unread: it.unread,
              message: it.message,
              messageAt: it.messageAt,
            ),
          )
          .toList();
    });
  }

  /// 移除会话和消息
  Future<void> omitChat(String sn) async {
    await transaction(() async {
      // 1. 删除消息
      await (delete(infosTable)
        ..where((t) => t.sn.equals(sn)))
          .go();

      // 2. 删除会话
      await (delete(chatsTable)
        ..where((t) => t.sn.equals(sn)))
          .go();
    });
  }

  /// ==========================================================================
  /// 消息操作
  /// ==========================================================================

  /// 插入消息
  Future<int> saveInfo(Info info) async {
    final data = InfosTableCompanion.insert(
      id: Value(info.id),
      sn: info.sn,
      clientId: info.clientId,
      type: info.type,
      userId: info.userId,
      avatar: Value(info.avatar),
      nickname: info.nickname,
      unread: info.unread,
      status: info.status,
      message: info.message,
      messageAt: info.messageAt,
    );
    return await into(infosTable).insertOnConflictUpdate(data);
  }

  /// 批量插入:
  Future<void> saveInfoList(List<Info> infos) async {
    final lists = infos
        .map(
          (info) => InfosTableCompanion.insert(
            id: Value(info.id),
            sn: info.sn,
            clientId: info.clientId,
            type: info.type,
            userId: info.userId,
            avatar: Value(info.avatar),
            nickname: info.nickname,
            unread: info.unread,
            status: info.status,
            message: info.message,
            messageAt: info.messageAt,
          ),
        )
        .toList();
    return await batch((bt) {
      bt.insertAllOnConflictUpdate(infosTable, lists);
    });
  }

  /// 监听变化
  Stream<List<Info>> listInfo(String sn) {
    final i = infosTable;
    final query = (select(i)
      ..where((t) => t.sn.equals(sn))
      ..orderBy([(t) => OrderingTerm.desc(t.messageAt)]));

    return query.watch().map((rows) {
      return rows
          .map(
            (it) => Info(
              id: it.id,
              sn: it.sn,
              clientId: it.clientId,
              type: it.type,
              userId: it.userId,
              avatar: it.avatar,
              nickname: it.nickname,
              unread: it.unread,
              status: it.status,
              message: it.message,
              messageAt: it.messageAt,
            ),
          )
          .toList();
    });
  }

  // /// 消息列表：包含用户头像、用户昵称，消息类型，消息内容；
  // Future<Page<ChatInfo>> selectChatInfoList() async {
  //
  // }
}
