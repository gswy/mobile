
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/hive/entity/mine.dart';
import 'package:get/get.dart';

class MineApis extends GetxService {
  final _http = Get.find<BaseHttp>();

  /// 获取当前登录用户
  Future<Mine?> getMine() async {
    try {
      return await _http.get<Mine>('/mine', fromJson: Mine.fromJson);
    } catch (e) {
      return null;
    }
  }

}