import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/datas/http/resp/room/info_resp.dart';
import 'package:app/model/info.dart';
import 'package:get/get.dart';

/// 详情获取
class InfoApis {
  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  /// 加载消息
  static Future<Page<Info>?> getInfoList({required String sn, int page = 1, size = 50}) async {
    try {
      return await _http.getPage<Info>('/infos',
        query: {'sn': sn, 'page': page, 'size': size},
        fromJson: Info.fromJson,
      );
    } catch (e) {
      Get.log('$e');
      return null;
    }
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
      return await _http.post<InfoResp>(
        '/info',
        data: {
          'chat': chat,
          'info': info,
          'clientId': clientId,
          'targetId': targetId,
          'parentId': parentId,
          'message': message,
          'messageAt': messageAt,
        },
        fromJson: InfoResp.fromJson,
      );
    } catch (e) {
      return null;
    }
  }
}
