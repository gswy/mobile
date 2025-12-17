
import 'package:app/ctrls/base/host_ctrl.dart';
import 'package:get/get.dart';

class HostBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HostCtrl());
  }

}