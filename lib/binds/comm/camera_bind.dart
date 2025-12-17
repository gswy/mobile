
import 'package:app/ctrls/comm/camera_ctrl.dart';
import 'package:get/get.dart';

class CameraBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CameraCtrl());
  }

}