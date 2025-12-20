
import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/model/chat.dart';
import 'package:get/get.dart';

/// 聊天页面
class ChatCtrl extends BaseCtrl {

  /// 连接状态
  final _conn = Get.find<BaseConn>();

  /// 是否加载
  RxBool get loading => _conn.loading;

  /// 是否连接
  RxBool get connect => _conn.connect;

  /// 会话列表
  Stream<List<ChatList>> get list => DB.dao.selectChatList(100);

  /// 开始请求



}