import 'package:app/cores/bases/base_http.dart';
import 'package:app/model/team.dart';
import 'package:app/datas/http/resp/team/team_info.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

/// 群组接口
class TeamApis {
  TeamApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 获取群组列表
  static Future<Page<Team>?> getTeamPage({int page = 1}) async {
    try {
      return await _http.getPage<Team>(
        '/teams',
        query: {'page': page},
        fromJson: Team.fromJson,
      );
    } catch (e) {
      return null;
    }
  }

  /// 创建群组
  static Future<bool> addTeam(List<int> userIds) async {
    try {
      await _http.post('/team', data: {'userIds': userIds});
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 获取群组信息
  static Future<TeamInfo?> getTeamInfo(int id) async {
    return await _http.get<TeamInfo>('/team/$id', fromJson: TeamInfo.fromJson);
  }

  /// 处理禁言
  static Future<void> handMute(int id) async {
    return await _http.post('/team/$id/mute');
  }

  /// 修改群名
  static Future<void> handName(int id, String name) async {
    return await _http.post('/team/$id/name', data: {'name': name});
  }

  /// 修改头像
  static Future<void> handLogo(int id, XFile file) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: file.name)
    });
    await _http.post('/team/$id/logo', data: formData);
  }

  /// 添加群员
  static Future<void> addTeamUser(int id, List<int> ids) async {
    await _http.post('/team/$id/user', data: {'ids': ids});
  }

}
