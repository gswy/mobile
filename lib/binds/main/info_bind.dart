
import 'package:app/ctrls/main/info_ctrl.dart';
import 'package:get/get.dart';

class InfoBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoCtrl());
  }

}