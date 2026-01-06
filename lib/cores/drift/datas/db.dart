
import 'package:app/cores/drift/datas/drift_datas.dart';
import 'package:app/cores/drift/datas/drift_model.dart';

/// 全局单例数据库操作
class DB {
  DB._();

  static final DB _instance = DB._();

  static DriftDatas get _db => _instance._database;

  late final DriftDatas _database = DriftDatas();

  static final dao = DriftModel(_db);

}