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
      sourceId: chat.sourceId,
      targetId: chat.targetId,
      title: chat.title,
      message: chat.message,
      messageAt: chat.messageAt,
    );
    return await into(chatsTable).insertOnConflictUpdate(data);
  }

  /// 批量插入:
  Future<void> saveChatList(List<Chat> chats) async {
    final lists = chats
        .map(
          (chat) => ChatsTableCompanion.insert(
            sn: chat.sn,
            id: Value(chat.id),
            type: chat.type,
            sourceId: chat.sourceId,
            targetId: chat.targetId,
            title: chat.title,
            message: chat.message,
            messageAt: chat.messageAt,
          ),
        )
        .toList();
    return await batch((bt) {
      bt.insertAllOnConflictUpdate(chatsTable, lists);
    });
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
  // Stream<List<ChatList>> selectChatList(int currentUserId) {
  //   return
  // }

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
      return rows.map((it) => Info(
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
      )).toList();
    });
  }

  // /// 消息列表：包含用户头像、用户昵称，消息类型，消息内容；
  // Future<Page<ChatInfo>> selectChatInfoList() async {
  //
  // }
}
