
/// 好友详情
class Mate {
  /// 好友标识
  final int id;

  /// 好友头像
  final String avatar;

  /// 好友昵称
  final String nickname;

  /// 好友账号
  final String username;

  /// 添加时间
  final int createdAt;

  /// 好友列表
  Mate({
    required this.id,
    required this.avatar,
    required this.nickname,
    required this.username,
    required this.createdAt,
  });
}

/// 好友列表
class MateList {
  /// 好友标识
  final int id;

  /// 好友头像
  final String avatar;

  /// 好友昵称
  final String nickname;

  MateList({required this.id, required this.avatar, required this.nickname});
}


