
/// 好友详情
class Mate {
  /// 好友标识
  final int id;

  /// 好友头像
  final String logo;

  /// 好友昵称
  final String nickname;

  /// 好友账号
  final String username;

  /// 添加时间
  final int createdAt;

  /// 好友列表
  Mate({
    required this.id,
    required this.logo,
    required this.nickname,
    required this.username,
    required this.createdAt,
  });
}

/// 好友列表
class MateList {
  /// 好友标识
  final int id;

  /// 好友索引
  final String index;

  /// 我的标识
  final String? logo;

  /// 好友昵称
  final String nickname;

  MateList({
    required this.id,
    required this.index,
    required this.logo,
    required this.nickname,
  });

  /// json转换
  factory MateList.fromJson(Map<String, dynamic> json) => MateList(
    id: json["id"],
    index: json["index"],
    logo: json["logo"],
    nickname: json["nickname"],
  );
}
