
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/model/mate.dart';
import 'package:get/get.dart';

/// 好友接口
class MateApis extends GetxService {
  MateApis._();

  static final _http = Get.find<BaseHttp>();

  /// 获取用户列表
  static Future<Page<MateList>?> getMatePage({int page = 1}) async {
    try {
      return await _http.getPage<MateList>('/mates', query: {'page': page}, fromJson: MateList.fromJson);
    } catch (_) {
      return null;
    }
  }

}