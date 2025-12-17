
import 'package:app/pages/main/info/mate/info_mate_controller.dart';
import 'package:app/pages/main/info/mate/info_mate_rest.dart';
import 'package:get/get.dart';

class InfoMateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoMateRest());
    Get.lazyPut(() => InfoMateController());
  }

}