
import 'package:app/route/base/base_pages.dart';
import 'package:app/route/comm/comm_pages.dart';
import 'package:app/route/main/main_pages.dart';

class AppRoute {
  AppRoute._();

  /// 集合路由
  static final routes = [
    ...BasePages.routes,  // 基础路由
    ...MainPages.routes,  // 业务路由
    ...CommPages.routes,  // 公共路由
  ];

}