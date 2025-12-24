

import 'package:app/ctrls/main/plus_ctrl.dart';
import 'package:get/get.dart';

/// 创建群组
class PlusBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlusCtrl());
  }
}
