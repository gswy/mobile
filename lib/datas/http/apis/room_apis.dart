import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/room/info_resp.dart';
import 'package:get/get.dart';

class RoomApis {
  RoomApis._();

  /// 请求实例
  static final _http = Get.find<BaseHttp>();

  static Future<InfoResp?> sendMateText({
    required int type,
    required int targetId,
    int? parentId,
    required String content,
    required String sourcedAt,
  }) async {
    return await _http.post<InfoResp>(
      '/chat/mate',
      data: {
        'type': type,
        'targetId': targetId,
        'parentId': parentId,
        'content': content,
        'sourcedAt': sourcedAt,
      },
      fromJson: InfoResp.fromJson,
    );
  }

  static Future<InfoResp?> sendTeamText({
    required int type,
    required int targetId,
    int? parentId,
    required String content,
    required String sourcedAt,
  }) async {
    return await _http.post<InfoResp>(
      '/chat/team',
      data: {
        'type': type,
        'targetId': targetId,
        'parentId': parentId,
        'content': content,
        'sourcedAt': sourcedAt,
      },
      fromJson: InfoResp.fromJson,
    );
  }






}
