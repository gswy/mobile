
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:get/get.dart';

class InfoMateRest extends GetxService {

  final _http = Get.find<BaseHttp>();

  Future<Mate?> getMate(int id) async {
    return await _http.get<Mate>('/mate/$id');
  }

}