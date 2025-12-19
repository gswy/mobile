import 'package:app/cores/dicts/news_dict.dart';
import 'package:app/datas/hive/entity/chat.dart';
import 'package:app/datas/hive/entity/info.dart';
import 'package:app/datas/hive/mapper/chat_hive.dart';
import 'package:app/datas/hive/mapper/info_hive.dart';
import 'package:app/datas/hive/mapper/mate_hive.dart';
import 'package:app/datas/hive/mapper/news_hive.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

/// 基本服务
class BaseNews extends GetxService {
  /// 消息存储
  final _news = Get.find<NewsHive>();

  /// 聊天存储
  final _info = Get.find<InfoHive>();

  /// 会话存储
  final _chat = Get.find<ChatHive>();

  /// 好友存储
  final _mate = Get.find<MateHive>();

  ///
  @override
  void onInit() {
    super.onInit();
    _news.listen((news) {
      /// 统一定义跳转路由
      var route = '';
      var arguments = {};

      /// 判定好友消息

      Get.log('消息变化');

      /// 公共跳转
      // Get.snackbar(news.title, news.message, duration: Duration(seconds: 5), onTap: (_) {
      //   if (route.isNotEmpty) {
      //     Get.toNamed(route, arguments: arguments);
      //   }
      // });

      /// 判定私聊消息
      if (news.type == NewsDict.chatMateForm) {
        /// 数据转换
        final info = Info.fromJson(news.payload);
        /// 插入数据
        _info.and(info);
        /// 判定会话
        if (!_chat.has(info.sourceId, 0)) {
          final mate = _mate.get(info.sourceId);
          if (mate != null) {
            _chat.add(
              Chat(
                id: mate.id,
                mode: 0,
                name: mate.nickname,
                avatar: mate.avatar,
                content: info.content,
                type: info.type,
                lastedAt: info.sourcedAt,
                unread: 1,
              ),
            );
          } else {

          }
        }
      }
    });
  }

  @override
  void onClose() {
    super.onInit();
  }
}
