
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

  /// 获取聊天
  Info? get(int id) {
    return _hive.get(id);
  }

  /// 创建聊天
  Future<int> add(Info chat) async {
    return await _hive.add(chat);
  }

  /// 更新聊天
  Future<void> put(int id, Info chat) async {
    return await _hive.put(id, chat);
  }

  /// 删除聊天
  Future<void> del(int id) async {
    await _hive.delete(id);
  }

}