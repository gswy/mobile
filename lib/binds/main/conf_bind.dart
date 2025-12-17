
import 'package:app/ctrls/main/conf_ctrl.dart';
import 'package:get/get.dart';

class ConfBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfCtrl());
  }
}