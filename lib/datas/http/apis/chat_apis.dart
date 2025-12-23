
import 'package:app/cores/bases/base_http.dart';
import 'package:app/model/chat.dart';
import 'package:get/get.dart';

/// 好友接口
class ChatApis extends GetxService {
  ChatApis._();

  static final _http = Get.find<BaseHttp>();

  /// 获取用户列表
  static Future<Page<Chat>?> getChatPage({int page = 1}) async {
    try {
      return await _http.getPage<Chat>('/chats', query: {'page': page}, fromJson: Chat.fromJson);
    } catch (_) {return null;}
  }

}