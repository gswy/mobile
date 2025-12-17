
import 'package:app/ctrls/comm/images_ctrl.dart';
import 'package:get/get.dart';

class ImagesBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagesCtrl());
  }

}