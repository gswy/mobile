
import 'package:app/ctrls/main/home_ctrl.dart';
import 'package:get/get.dart';

/// 主页绑定
class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeCtrl(), permanent: true);
  }
}