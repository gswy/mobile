
import 'package:app/cores/bases/base_http.dart';
import 'package:app/model/team.dart';
import 'package:app/datas/http/resp/team/team_info.dart';
import 'package:get/get.dart';

/// 群组接口
class TeamApis {

  TeamApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();


  /// 获取群组列表
  static Future<Page<TeamList>?> getTeamPage({int page = 1}) async {
    try {
      return await _http.getPage<TeamList>('/mates', query: {'page': page}, fromJson: TeamList.fromJson);
    } catch (_) {
      return null;
    }
  }

  /// 创建群组
  static Future<Page<TeamList>?> addTeam({int page = 1}) async {
    try {
      return await _http.getPage<TeamList>('/mates', query: {'page': page}, fromJson: TeamList.fromJson);
    } catch (_) {
      return null;
    }
  }

  /// 获取群组信息
  static Future<TeamInfo?> getTeamInfo(int id) async {
    return await _http.get<TeamInfo>('/user/$id', fromJson: TeamInfo.fromJson);
  }



}