
import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/bases/base_http.dart';
import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/utils/sign_util.dart';
import 'package:app/cores/value/host_constants.dart';
import 'package:app/datas/serv/conn_serv.dart';
import 'package:app/route/base/base_route.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

/// 启动页面
class StarCtrl extends BaseCtrl {

  @override
  void onInit() {
    super.onInit();
    Future.microtask(_init);
  }

  /// 初始操作
  Future<void> _init() async {
    final host = LocalStore.getString(HostConstants.hostKey) ?? '';
    /// 1. 检查地址是否有效
    if (host.isEmpty) {
      Get.offAllNamed(BaseRoute.host);
      return;
    }
    final http = Get.find<BaseHttp>();
    http.setBaseURL('https://$host');

    /// 2. 业务令牌是否有效
    if (SignUtil.hasToken()) {
      try {
        /// 2.1. 获取用户信息
        final auth = Get.find<BaseAuth>();
        await auth.init();

        /// 2.2. 启动连接服务
        final conn = Get.find<ConnServ>();
        await conn.star();

        /// 2.2. 连接成功进入
        Get.offAllNamed(MainRoute.home);
        return;
      } catch(e) {
        Get.log('连接错误: $e');
        /// TODO 记录日志
      }
    }
    /// 4. 没有有效令牌去登录
    Get.offAllNamed(BaseRoute.signin);
  }


}