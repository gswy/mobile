
import 'package:app/cores/drift/datas/drift_datas.dart';
import 'package:app/cores/drift/datas/drift_model.dart';
import 'package:app/cores/drift/enums/chat_type_enum.dart';
import 'package:drift/drift.dart';

/// 全局单例数据库操作
class DB {
  DB._();

  static final DB _instance = DB._();

  static DriftDatas get _db => _instance._database;

  late final DriftDatas _database = DriftDatas();

  static final dao = DriftModel(_db);

  static void test() {
    Future.delayed(const Duration(seconds: 6), () {
      dao.insertChat(ChatsTableCompanion.insert(
        type: ChatTypeEnum.mate,
        sourceId: 100,
        targetId: 200,
        unread: Value(1),
        content: '测试消息',
      ));
    });
    Future.delayed(const Duration(seconds: 10), () {
      dao.insertChat(ChatsTableCompanion.insert(
        type: ChatTypeEnum.mate,
        sourceId: 100,
        targetId: 200,
        unread: Value(2),
        content: '测试消息',
      ));
    });

    Future.delayed(const Duration(seconds: 15), () {
      dao.insertChat(ChatsTableCompanion.insert(
        type: ChatTypeEnum.mate,
        sourceId: 100,
        targetId: 200,
        unread: Value(3),
        content: '测试消息',
      ));
    });

    Future.delayed(const Duration(seconds: 20), () {
      dao.insertChat(ChatsTableCompanion.insert(
        type: ChatTypeEnum.mate,
        sourceId: 100,
        targetId: 200,
        unread: Value(4),
        content: '测试消息',
      ));
    });


  }

}