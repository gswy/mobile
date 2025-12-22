
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/cores/model/info.dart';
import 'package:app/cores/utils/uuid_util.dart';
import 'package:app/datas/http/resp/info/info_team.dart';
import 'package:app/datas/http/resp/info/info_user.dart';
import 'package:app/datas/http/resp/room/info_resp.dart';
import 'package:get/get.dart';

/// 详情获取
class InfoApis {

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 获取用户信息
  static Future<InfoUser?> getInfoUser(int id) async {
    return await _http.get<InfoUser>('/info/$id/user', fromJson: InfoUser.fromJson);
  }

  /// 获取群组信息
  static Future<InfoTeam?> getInfoTeam(int id) async {
    return await _http.get<InfoTeam>('/info/$id/team', fromJson: InfoTeam.fromJson);
  }

  /// 发送消息
  static Future<InfoResp?> send({
    required int chat,
    required int info,
    required String clientId,
    required int targetId,
    int? parentId,
    required String message,
    required int messageAt,
  }) async {
    try {
      return await _http.post<InfoResp>('/info', data: {
        'chat': chat,
        'info': info,
        'clientId': clientId,
        'targetId': targetId,
        'parentId': parentId,
        'message': message,
        'messageAt': messageAt,
      }, fromJson: InfoResp.fromJson);
    } catch (e) {
      return null;
    }
  }

}