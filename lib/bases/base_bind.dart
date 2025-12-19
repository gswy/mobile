
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
import 'package:app/datas/http/apis/auth_apis.dart';
import 'package:app/datas/http/apis/bind_apis.dart';
import 'package:app/datas/http/apis/comm_apis.dart';
import 'package:app/datas/http/apis/conf_apis.dart';
import 'package:app/datas/http/apis/find_apis.dart';
import 'package:app/datas/http/apis/host_apis.dart';
import 'package:app/datas/http/apis/info_apis.dart';
import 'package:app/datas/http/apis/mate_apis.dart';
import 'package:app/datas/http/apis/mine_apis.dart';
import 'package:app/datas/http/apis/room_apis.dart';
import 'package:app/datas/http/apis/team_apis.dart';
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
    /// 绑定请求
    Get.put(AuthApis(), permanent: true);
    Get.put(BindApis(), permanent: true);
    Get.put(CommApis(), permanent: true);
    Get.put(ConfApis(), permanent: true);
    Get.put(FindApis(), permanent: true);
    Get.put(HostApis(), permanent: true);
    Get.put(InfoApis(), permanent: true);
    Get.put(MateApis(), permanent: true);
    Get.put(MineApis(), permanent: true);
    Get.put(RoomApis(), permanent: true);
    Get.put(TeamApis(), permanent: true);
    /// 绑定服务
    Get.put(BaseAuth(), permanent: true);
    Get.put(BaseNews(), permanent: true);
  }
}
