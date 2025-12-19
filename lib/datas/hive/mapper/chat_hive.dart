
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

  /// 判断会话
  bool has(int id, mode) {
    return _hive.values.any((e) => e.id == id && e.mode == mode);
  }

  List<Chat> getList() {
    return _hive.values.toList();
  }

  /// 创建群组信息
  Future<void> add(Chat chat) async {
    await _hive.put(chat.id, chat);
  }

  /// 删除群组信息
  Future<void> del(int id) async {
    await _hive.delete(id);
  }

}