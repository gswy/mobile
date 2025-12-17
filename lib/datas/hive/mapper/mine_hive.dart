
import 'package:app/datas/hive/entity/mine.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 个人信息
class MineHive extends GetxService {

  /// 本地存储群组
  final _hive = Hive.box<Mine>('mine');

  /// 获取个人信息
  Mine? get() {
    return _hive.get('mine');
  }

  /// 创建个人信息
  Future<void> add(Mine mine) async {
    await _hive.put('mine', mine);
  }

  /// 删除个人信息
  Future<void> del() async {
    await _hive.delete('mine');
  }

}