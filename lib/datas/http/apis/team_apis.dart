
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/team/team_info.dart';
import 'package:get/get.dart';

class TeamApis {

  TeamApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();
  /// 获取群组信息
  static Future<TeamInfo?> getTeamInfo(int id) async {
    return await _http.get<TeamInfo>('/user/$id', fromJson: TeamInfo.fromJson);
  }

}