
import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/bases/base_news.dart';
import 'package:app/datas/serv/conn_serv.dart';
import 'package:get/get.dart';

/// 绑定基础服务
class BaseBind extends Bindings {
  @override
  void dependencies() {
    /// 基本信息
    Get.put(BaseHttp(), permanent: true);
    Get.put(ConnServ(), permanent: true);
    /// 绑定服务
    Get.put(BaseAuth(), permanent: true);
    Get.put(BaseNews(), permanent: true);
  }
}
