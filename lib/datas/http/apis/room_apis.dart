import 'package:app/cores/bases/base_http.dart';
import 'package:app/datas/http/resp/room/info_resp.dart';
import 'package:get/get.dart';

class RoomApis extends GetxService {
  final _http = Get.find<BaseHttp>();

  Future<InfoResp?> sendText({
    required int mode,
    required int type,
    required int targetId,
    int? parentId,
    required String content,
    required String sourcedAt,
  }) async {
    return await _http.post<InfoResp>(
      '/info',
      data: {
        'mode': mode,
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
