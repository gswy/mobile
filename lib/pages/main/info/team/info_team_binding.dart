
import 'package:app/pages/main/info/team/info_team_controller.dart';
import 'package:get/get.dart';

class InfoTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoTeamController());
  }

}