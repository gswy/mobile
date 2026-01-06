
import 'package:app/ctrls/main/team/team_user_ctrl.dart';
import 'package:get/get.dart';

/// 群组列表
class TeamUserBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamUserCtrl());
  }
}