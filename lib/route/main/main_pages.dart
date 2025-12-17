import 'package:app/binds/main/conf_bind.dart';
import 'package:app/pages/main/bind/bind_form_page.dart';
import 'package:app/pages/main/bind/bind_news_page.dart';
import 'package:app/binds/main/find_bind.dart';
import 'package:app/pages/main/conf/conf_auth_page.dart';
import 'package:app/pages/main/conf/conf_desk_page.dart';
import 'package:app/pages/main/conf/conf_lang_page.dart';
import 'package:app/pages/main/conf/conf_like_page.dart';
import 'package:app/pages/main/conf/conf_news_page.dart';
import 'package:app/pages/main/conf/conf_safe_page.dart';
import 'package:app/pages/main/conf/conf_view_page.dart';
import 'package:app/pages/main/find/find_page.dart';
import 'package:app/binds/main/home_bind.dart';
import 'package:app/pages/main/home/home_page.dart';
import 'package:app/binds/main/bind_bind.dart';
import 'package:app/pages/main/bind/bind_hand_page.dart';
import 'package:app/binds/main/room_bind.dart';
import 'package:app/pages/main/room/room_page.dart';
import 'package:app/pages/main/conf/conf_mine_page.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

class MainPages {
  MainPages._();

  static final routes = [
    /// 主页切换
    GetPage(
      name: MainRoute.home,
      page: () => HomePage(),
      binding: HomeBind(),
    ),

    /// 房间内页
    GetPage(
      name: MainRoute.room,
      page: () => RoomPage(),
      binding: RoomBind(),
    ),

    /// 搜索页面
    GetPage(
      name: MainRoute.find,
      page: () => FindPage(),
      binding: FindBind(),
    ),

    /// 申请添加
    GetPage(
      name: MainRoute.bindForm,
      page: () => BindFormPage(),
      binding: BindBind(),
    ),

    /// 审核列表
    GetPage(
      name: MainRoute.bindNews,
      page: () => BindNewsPage(),
      binding: BindBind(),
    ),

    /// 审核申请
    GetPage(
      name: MainRoute.bindHand,
      page: () => BindHandPage(),
      binding: BindBind(),
    ),


    /// --------- 设置相关 ---------

    /// 账户设置
    GetPage(
      name: MainRoute.confMine,
      page: () => ConfMinePage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confLike,
      page: () => ConfLikePage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confView,
      page: () => ConfViewPage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confLang,
      page: () => ConfLangPage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confNews,
      page: () => ConfNewsPage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confSafe,
      page: () => ConfSafePage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confDesk,
      page: () => ConfDeskPage(),
      binding: ConfBind(),
    ),

    /// 账户设置
    GetPage(
      name: MainRoute.confAuth,
      page: () => ConfAuthPage(),
      binding: ConfBind(),
    ),






  ];
}
