
import 'package:app/datas/hive/entity/user.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 群组成员
class UserHive extends GetxService {

  /// 本地存储
  final _hive = Hive.box<User>('user');

  /// 群组群员
  final users = <User>[].obs;

  /// 初始数据
  @override
  void onInit() {
    super.onInit();
    _init();
    _hive.watch().listen((event) {
      _init();
    });
  }

  /// 刷新数据
  void _init() {
    users.assignAll(_hive.values.toList());
  }

  /// 获取群组信息
  User? get(int id) {
    return _hive.get(id);
  }

  /// 创建群组信息
  Future<void> add(int teamId, User user) async {
    await _hive.put(teamId, user);
  }

  /// 删除群组信息
  Future<void> del(int teamId, int userId) async {
    await _hive.delete(teamId);
  }

}