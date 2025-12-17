
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:get/get.dart';

class MateApis extends GetxService {
  final _http = Get.find<BaseHttp>();

  /// 获取用户分页
  Future<Page<Mate>> getMatePage(int page, int size) async {
    return await _http.getPage(
      '/mates',
      query: {'page': page, 'size': size},
      fromJson: Mate.fromJson,
    );
  }


}