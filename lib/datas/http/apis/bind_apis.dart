
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/bind/bind_team.dart';
import 'package:app/datas/http/resp/bind/bind_user.dart';
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

  /// 申请添加
  Future<bool> bindTeam(int id, String remark) async {
    try {
      await _http.post('/bind/team', data: {'targetId': id, 'remark': remark});
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 申请列表：好友申请
  Future<Page<BindUser>> getBindUserList() async {
    return await _http.getPage('/bind/users', fromJson: BindUser.fromJson);
  }

  /// 申请列表：群组申请
  Future<Page<BindTeam>> getBindTeamList() async {
    return await _http.getPage('/bind/teams', fromJson: BindTeam.fromJson);
  }

  /// 获取详情：好友申请
  Future<BindUser?> getBindUser(int id) async {
    return await _http.get('/bind/user/$id', fromJson: BindUser.fromJson);
  }

  /// 获取详情：群组申请
  Future<BindUser?> getBindTeam(int id) async {
    return await _http.get('/bind/team/$id', fromJson: BindUser.fromJson);
  }

  /// 处理审核：好友申请
  Future<bool> handBindUser(int id, int status) async {
    return await _http.put('/bind/user', data: {'id': id, 'status': status});
  }

  /// 处理审核：群组申请
  Future<bool> handBindTeam(int id, int status) async {
    return await _http.put('/bind/team', data: {'id': id, 'status': status});
  }

}