
import 'package:app/ctrls/base/star_ctrl.dart';
import 'package:get/get.dart';

class StarBind extends Bindings {
  @override
  void dependencies() {
    Get.put(StarCtrl());
  }
}