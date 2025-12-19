
import 'package:app/datas/hive/entity/info.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 消息列表
class InfoHive extends GetxService {

  /// 本地存储聊天
  final _hive = Hive.box<Info>('info');

  /// 可观察列表
  final infos = <Info>[].obs;

  @override
  void onInit() {
    super.onInit();
    _init();
    _hive.watch().listen((event) {
      _init();
    });
  }

  void _init() {
    infos.assignAll(_hive.values.toList());
  }

  /// 获取消息
  Info? get(int id) {
    return _hive.get(id);
  }

  /// 创建消息
  Future<int> add(Info info) async {
    return await _hive.add(info);
  }

  /// 插入消息
  Future<void> and(Info info) async {
    final res = _hive.values.any((it) => it.id == info.id);
    if (!res) {
      await add(info);
    }
  }

  /// 更新消息
  Future<void> put(int id, Info info) async {
    return await _hive.put(id, info);
  }

  /// 删除消息
  Future<void> del(int id) async {
    await _hive.delete(id);
  }

}