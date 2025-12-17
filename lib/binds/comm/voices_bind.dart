
import 'package:app/ctrls/comm/voices_ctrl.dart';
import 'package:get/get.dart';

class VoicesBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoicesCtrl());
  }

}