import 'package:app/cores/bases/base_ctrl.dart';
import 'package:get/get.dart';

class ImagesCtrl extends BaseCtrl {

  /// 加载说明
  final message = ''.obs;

  /// 是否加载
  final loading = false.obs;

  /// 文件路径
  final filepath = ''.obs;

  @override void onInit() {
    super.onInit();
    filepath.value = Get.arguments as String;
  }

}
