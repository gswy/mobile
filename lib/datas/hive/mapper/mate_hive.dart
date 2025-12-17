
import 'package:app/datas/hive/entity/mate.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 好友列表
class MateHive extends GetxService {

  /// 本地存储会话
  final _hive = Hive.box<Mate>('mate');

  /// 好友列表
  final mates = <Mate>[].obs;

  /// 消息
  @override
  void onInit() {
    super.onInit();
    _init();
    _hive.watch().listen((event) {
      _init();
    });
  }

  void _init() {
    mates.assignAll(_hive.values.toList());
  }

  /// 获取好友列表
  List<Mate> getList() {
    return _hive.values.toList();
  }

  /// 获取好友
  Mate? get(int id) {
    return _hive.get(id);
  }

  /// 添加好友
  Future<void> add(Mate mate) async {
    await _hive.put(mate.id, mate);
  }

  /// 删除好友
  Future<void> del(int id) async {
    await _hive.delete(id);
  }

}