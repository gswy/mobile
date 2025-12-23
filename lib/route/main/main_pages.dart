import 'package:app/binds/main/conf_bind.dart';
import 'package:app/binds/main/info_bind.dart';
import 'package:app/binds/main/team_bind.dart';
import 'package:app/pages/main/bind/team/team_form_page.dart';
import 'package:app/binds/main/find_bind.dart';
import 'package:app/pages/main/bind/team/team_hand_page.dart';
import 'package:app/pages/main/bind/team/team_list_page.dart';
import 'package:app/pages/main/bind/user/user_form_page.dart';
import 'package:app/pages/main/bind/user/user_hand_page.dart';
import 'package:app/pages/main/bind/user/user_list_page.dart';
import 'package:app/pages/main/conf/conf_auth_page.dart';
import 'package:app/pages/main/conf/conf_desk_page.dart';
import 'package:app/pages/main/conf/conf_lang_page.dart';
import 'package:app/pages/main/conf/conf_like_page.dart';
import 'package:app/pages/main/conf/conf_news_page.dart';
import 'package:app/pages/main/conf/conf_safe_page.dart';
import 'package:app/pages/main/conf/conf_serv_page.dart';
import 'package:app/pages/main/conf/conf_view_page.dart';
import 'package:app/pages/main/find/find_page.dart';
import 'package:app/binds/main/home_bind.dart';
import 'package:app/pages/main/home/home_page.dart';
import 'package:app/binds/main/bind_bind.dart';
import 'package:app/binds/main/room_bind.dart';
import 'package:app/pages/main/home/team_page.dart';
import 'package:app/pages/main/team/team_info_page.dart';
import 'package:app/pages/main/room/room_page.dart';
import 'package:app/pages/main/conf/conf_mine_page.dart';
import 'package:app/pages/main/user/user_info_page.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

class MainPages {
  MainPages._();

  static final routes = [
    /// --------- 公共主页 ---------
    /// 主页切换
    GetPage(
      name: MainRoute.home,
      page: () => HomePage(),
      binding: HomeBind(),
    ),
    /// 群组列表
    GetPage(
      name: MainRoute.room,
      page: () => RoomPage(),
      binding: RoomBind(),
    ),

    /// --------- 聊天页面 ---------
    /// 群组列表
    GetPage(
      name: MainRoute.team,
      page: () => TeamPage(),
      binding: TeamBind(),
    ),

    /// --------- 搜索页面 ---------

    /// 搜索页面
    GetPage(
      name: MainRoute.find,
      page: () => FindPage(),
      binding: FindBind(),
    ),

    /// --------- 关系绑定 ---------
    /// 申请添加：好友表单
    GetPage(
      name: MainRoute.bindUserForm,
      page: () => UserFormPage(),
      binding: BindBind(),
    ),

    /// 审核列表：好友申请
    GetPage(
      name: MainRoute.bindUserList,
      page: () => UserListPage(),
      binding: BindBind(),
    ),

    /// 审核申请：好友审核
    GetPage(
      name: MainRoute.bindUserHand,
      page: () => UserHandPage(),
      binding: BindBind(),
    ),

    /// 申请添加：群组表单
    GetPage(
      name: MainRoute.bindTeamForm,
      page: () => TeamFormPage(),
      binding: BindBind(),
    ),

    /// 审核列表：群组申请
    GetPage(
      name: MainRoute.bindTeamList,
      page: () => TeamListPage(),
      binding: BindBind(),
    ),

    /// 审核申请：群组审核
    GetPage(
      name: MainRoute.bindTeamHand,
      page: () => TeamHandPage(),
      binding: BindBind(),
    ),

    /// --------- 详情相关 ---------
    /// 好友详情
    GetPage(
      name: MainRoute.userInfo,
      page: () => UserInfoPage(),
      binding: InfoBind(),
    ),

    /// 群组详情
    GetPage(
      name: MainRoute.teamInfo,
      page: () => TeamInfoPage(),
      binding: InfoBind(),
    ),

    /// --------- 设置相关 ---------

    /// 账户设置
    GetPage(
      name: MainRoute.confMine,
      page: () => ConfMinePage(),
      binding: ConfBind(),
    ),

    /// 我的收藏
    GetPage(
      name: MainRoute.confLike,
      page: () => ConfLikePage(),
      binding: ConfBind(),
    ),

    /// 外观设置
    GetPage(
      name: MainRoute.confView,
      page: () => ConfViewPage(),
      binding: ConfBind(),
    ),

    /// 语言设置
    GetPage(
      name: MainRoute.confLang,
      page: () => ConfLangPage(),
      binding: ConfBind(),
    ),

    /// 消息通知
    GetPage(
      name: MainRoute.confNews,
      page: () => ConfNewsPage(),
      binding: ConfBind(),
    ),

    /// 隐私
    GetPage(
      name: MainRoute.confSafe,
      page: () => ConfSafePage(),
      binding: ConfBind(),
    ),

    /// 隐私设置
    GetPage(
      name: MainRoute.confServ,
      page: () => ConfServPage(),
      binding: ConfBind(),
    ),

    /// 服务信息
    GetPage(
      name: MainRoute.confDesk,
      page: () => ConfDeskPage(),
      binding: ConfBind(),
    ),

    /// 登录设备
    GetPage(
      name: MainRoute.confAuth,
      page: () => ConfAuthPage(),
      binding: ConfBind(),
    ),

  ];
}
