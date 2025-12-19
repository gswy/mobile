
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/info/info_team.dart';
import 'package:app/datas/http/resp/info/info_user.dart';
import 'package:get/get.dart';

///
class InfoApis extends GetxService {

  final _http = Get.find<BaseHttp>();

  /// 获取用户信息
  Future<InfoUser?> getInfoUser(int id) async {
    return await _http.get<InfoUser>('/info/$id/user', fromJson: InfoUser.fromJson);
  }

  /// 获取群组信息
  Future<InfoTeam?> getInfoTeam(int id) async {
    return await _http.get<InfoTeam>('/info/$id/team', fromJson: InfoTeam.fromJson);
  }

}