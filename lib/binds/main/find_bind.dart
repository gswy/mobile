
import 'package:app/ctrls/main/find_ctrl.dart';
import 'package:get/get.dart';

/// 查找绑定
class FindBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindCtrl());
  }
}