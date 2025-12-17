
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/bind/bind_mate.dart';
import 'package:get/get.dart';

class BindApis extends GetxService {

  /// 请求实例
  final _http = Get.find<BaseHttp>();

  /// 申请添加
  Future<bool> bindUser(int id, String remark) async {
    try {
      await _http.post('/bind/user', data: {'targetId': id, 'remark': remark});
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 申请列表
  Future<Page<BindMate>> getBindMates() async {
    return await _http.getPage('/bind/mates', fromJson: BindMate.fromJson);
  }

  /// 获取申请
  Future<BindMate?> getBindMate(int id) async {
    return await _http.get('/bind/mate/$id', fromJson: BindMate.fromJson);
  }

  /// 处理审核
  Future<bool> handBindMate(int id, int status) async {
    return await _http.put('/bind/mate', data: {'id': id, 'status': status});
  }

}