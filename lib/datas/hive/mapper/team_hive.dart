
import 'package:app/datas/hive/entity/team.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 群组信息
class TeamHive extends GetxService {

  /// 本地存储群组
  final _hive = Hive.box<Team>('team');

  /// 群组列表
  final teams = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    _init();
    _hive.watch().listen((event) {
      _init();
    });
  }

  void _init() {
    teams.assignAll(_hive.values.toList());
  }

  /// 获取群组信息
  Team? get(int id) {
    return _hive.get(id);
  }

  /// 创建群组信息
  Future<void> add(Team team) async {
    await _hive.put(team.id, team);
  }

  /// 删除群组信息
  Future<void> del(int id) async {
    await _hive.delete(id);
  }

}