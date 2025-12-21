
import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/model/chat.dart';
import 'package:get/get.dart';

/// 会话页面
class ChatCtrl extends BaseCtrl {

  /// 连接状态
  final _conn = Get.find<BaseConn>();

  /// 是否加载
  RxBool get loading => _conn.loading;

  /// 是否连接
  RxBool get connect => _conn.connect;

  /// 开始请求
  final chatList = <ChatList>[].obs;

  /// 加载会话
  @override void onInit() {
    super.onInit();
  }

}