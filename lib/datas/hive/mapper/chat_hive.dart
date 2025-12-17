
import 'package:app/datas/hive/entity/chat.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 会话列表
class ChatHive extends GetxService {

  /// 本地会话
  final _hive = Hive.box<Chat>('chat');

  /// 聊天列表
  final chats = <Chat>[].obs;

  /// 初始化
  @override
  void onInit() {
    super.onInit();
    _init();
    _hive.watch().listen((event) {
      _init();
    });
  }

  /// 读取数据
  void _init() {
    chats.assignAll(_hive.values.toList());
  }

  /// 获取群组信息
  Chat? get(int id) {
    return _hive.get(id);
  }

  List<Chat> getList() {
    return _hive.values.toList();
  }

  /// 创建群组信息
  Future<void> add(Chat team) async {
    await _hive.put(team.id, team);
  }

  /// 删除群组信息
  Future<void> del(int id) async {
    await _hive.delete(id);
  }

}