
import 'package:app/ctrls/comm/qrcode_ctrl.dart';
import 'package:get/get.dart';

class QrcodeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrcodeCtrl());
  }

}