
import 'package:app/ctrls/base/sign_ctrl.dart';
import 'package:get/get.dart';

class SignBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignCtrl());
  }

}