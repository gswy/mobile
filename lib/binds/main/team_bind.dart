
import 'package:app/ctrls/main/team_ctrl.dart';
import 'package:get/get.dart';

/// 群组列表
class TeamBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamCtrl());
  }
}