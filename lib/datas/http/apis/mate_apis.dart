
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:get/get.dart';

/// 好友接口
class MateApis extends GetxService {
  MateApis._();

  static final _http = Get.find<BaseHttp>();

  /// 获取用户列表
  static Future<List<Mate>> getMateList() async {
    return await _http.getList('/mates', fromJson: Mate.fromJson);
  }

}