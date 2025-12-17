
import 'package:app/ctrls/main/bind_ctrl.dart';
import 'package:get/get.dart';

class BindBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindCtrl());
  }
}