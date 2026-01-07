
import 'package:app/ctrls/main/home/chat_ctrl.dart';
import 'package:app/ctrls/main/home/work_ctrl.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/ctrls/main/home/mate_ctrl.dart';
import 'package:app/ctrls/main/home/mine_ctrl.dart';
import 'package:get/get.dart';

/// 主页绑定
class HomeBind extends Bindings {
  @override
  void dependencies() {
    /// 子页面
    Get.lazyPut(() => WorkCtrl());
    Get.lazyPut(() => ChatCtrl());
    Get.lazyPut(() => MateCtrl());
    Get.lazyPut(() => MineCtrl());
    /// 主页面
    Get.lazyPut(() => HomeCtrl());
  }
}