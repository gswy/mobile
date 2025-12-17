
import 'package:app/ctrls/comm/videos_ctrl.dart';
import 'package:get/get.dart';

class VideosBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideosCtrl());
  }

}