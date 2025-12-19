
import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/datas/hive/entity/chat.dart';
import 'package:app/datas/hive/mapper/chat_hive.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatCtrl extends BaseCtrl {
  /// 持久数据
  final _hive = Get.find<ChatHive>();

  /// 连接状态
  final _conn = Get.find<BaseConn>();

  /// 是否加载
  RxBool get loading => _conn.loading;

  /// 是否连接
  RxBool get connect => _conn.connect;

  /// 会话列表
  RxList<Chat> get list => _hive.chats;

  /// 开始请求



}