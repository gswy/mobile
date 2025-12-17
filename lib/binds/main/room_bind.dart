
import 'package:app/ctrls/main/room_ctrl.dart';
import 'package:get/get.dart';

/// 房间绑定
class RoomBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomCtrl());
  }
}