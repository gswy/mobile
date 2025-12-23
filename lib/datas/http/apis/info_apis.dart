
import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/room/info_resp.dart';
import 'package:get/get.dart';

/// 详情获取
class InfoApis {

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

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