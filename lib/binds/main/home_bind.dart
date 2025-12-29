
import 'package:app/ctrls/main/chat_ctrl.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/ctrls/main/mate_ctrl.dart';
import 'package:app/ctrls/main/mine_ctrl.dart';
import 'package:get/get.dart';

/// 主页绑定
class HomeBind extends Bindings {
  @override
  void dependencies() {
    /// 子页面
    Get.lazyPut(() => ChatCtrl());
    Get.lazyPut(() => MateCtrl());
    Get.lazyPut(() => MineCtrl());
    /// 主页面
    Get.lazyPut(() => HomeCtrl());
  }
}