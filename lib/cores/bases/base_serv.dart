
import 'package:app/cores/dicts/news_dict.dart';
import 'package:app/datas/hive/mapper/news_hive.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

/// 基本服务
class BaseServ extends GetxService {

  /// 消息存储
  final _hive = Get.find<NewsHive>();

  ///
  @override
  void onInit() {
    super.onInit();
    _hive.listen((news) {
      /// 统一定义跳转路由
      var route = '';
      var arguments = {};

      /// 判定好友消息
      if (news.type == NewsDict.bindUserForm) {
        route = MainRoute.bindNews;
      }

      Get.log('消息变化');



      /// 公共跳转
      Get.snackbar(news.title, news.message, duration: Duration(seconds: 5), onTap: (_) {
        if (route.isNotEmpty) {
          Get.toNamed(route, arguments: arguments);
        }
      });
    });
  }

  @override
  void onClose() {
    super.onInit();
  }
}