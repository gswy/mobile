
/// 业务内页
class MainRoute {
  MainRoute._();

  /// ------------ 顶级页面 ---------------
  /// 基本页面
  static const String home = '/home';
  
  /// 聊天页面
  static const String room = '/room';

  /// 群组列表
  static const String team = '/team';

  /// 搜索页面
  static const String find = '/find';

  /// ------------ 关系绑定 ---------------
  /// 搜索结果
  static const String findInfo = '/find/info';

  /// 好友搜索
  static const String findUserInfo = '/find/user/info';

  /// 群组搜索
  static const String findTeamInfo = '/find/team/info';

  /// 申请添加
  static const String bindUserForm = '/bind/user/form';

  /// 申请列表
  static const String bindUserList = '/bind/user/list';

  /// 审核申请
  static const String bindUserHand = '/bind/user/hand';

  /// 申请添加
  static const String bindTeamForm = '/bind/team/form';

  /// 申请列表
  static const String bindTeamList = '/bind/team/list';

  /// 审核申请
  static const String bindTeamHand = '/bind/team/hand';

  /// ------------ 详情页面 ---------------

  /// 好友详情
  static const String infoMate = '/info/mate';

  /// 群组详情
  static const String infoTeam = '/info/team';

  /// ------------ 我的设置 ---------------

  /// 设置-账户设置
  static const String confMine = '/conf/mine';

  /// 设置-我的收藏
  static const String confLike = '/conf/like';

  /// 设置-外观设置
  static const String confView = '/conf/view';

  /// 设置-语言设置
  static const String confLang = '/conf/lang';

  /// 设置-消息通知
  static const String confNews = '/conf/news';

  /// 设置-隐私设置
  static const String confSafe = '/conf/safe';

  /// 设置-服务信息
  static const String confServ = '/conf/serv';

  /// 设置-登录设备
  static const String confDesk = '/conf/desk';

  /// 设置-账号管理
  static const String confAuth = '/conf/auth';

}