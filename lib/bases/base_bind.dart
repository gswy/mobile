
import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/bases/base_news.dart';
import 'package:app/datas/hive/mapper/chat_hive.dart';
import 'package:app/datas/hive/mapper/info_hive.dart';
import 'package:app/datas/hive/mapper/mate_hive.dart';
import 'package:app/datas/hive/mapper/mine_hive.dart';
import 'package:app/datas/hive/mapper/news_hive.dart';
import 'package:app/datas/hive/mapper/team_hive.dart';
import 'package:app/datas/hive/mapper/user_hive.dart';
import 'package:get/get.dart';

/// 绑定基础服务
class BaseBind extends Bindings {
  @override
  void dependencies() {
    /// 绑定存储
    Get.put(ChatHive(), permanent: true);
    Get.put(InfoHive(), permanent: true);
    Get.put(MateHive(), permanent: true);
    Get.put(MineHive(), permanent: true);
    Get.put(NewsHive(), permanent: true);
    Get.put(TeamHive(), permanent: true);
    Get.put(UserHive(), permanent: true);
    /// 基本信息
    Get.put(BaseHttp(), permanent: true);
    Get.put(BaseConn(), permanent: true);
    /// 绑定服务
    Get.put(BaseAuth(), permanent: true);
    Get.put(BaseNews(), permanent: true);
  }
}
