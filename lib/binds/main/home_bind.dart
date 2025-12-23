
import 'package:app/ctrls/main/chat_ctrl.dart';
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:app/ctrls/main/mate_ctrl.dart';
import 'package:app/ctrls/main/mine_ctrl.dart';
import 'package:get/get.dart';

/// 主页绑定
class HomeBind extends Bindings {
  @override
  void dependencies() {
    /// 主页面
    Get.put(HomeCtrl());

    /// 子页面
    Get.put(ChatCtrl());
    Get.put(MateCtrl());
    Get.put(MineCtrl());
  }
}