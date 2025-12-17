

/// 消息类型定义
class NewsDict {
  NewsDict._();

  /// 申请好友通知
  static const bindUserForm = 'BIND_USER_FORM';

  /// 申请好友结果
  static const bindUserResp = 'BIND_USER_RESP';

  /// 申请加群通知
  static const bindTeamForm = 'BIND_TEAM_FORM';

  /// 申请加群结果
  static const bindTeamResp = 'BIND_TEAM_RESP';

  /// 私聊消息通知
  static const chatMateForm = 'CHAT_MATE_FORM';

  /// 群聊消息通知
  static const chatTeamForm = 'CHAT_TEAM_FORM';

  /// 私聊消息撤回
  static const chatMateBack = 'CHAT_MATE_BACK';

  /// 群聊消息撤回
  static const chatTeamBack = 'CHAT_TEAM_BACK';

}