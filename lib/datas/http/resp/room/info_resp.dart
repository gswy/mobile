
/// 云端消息
class InfoResp {

  /// 消息标识
  final int id;

  /// 消息标识（本地）
  final String clientId;

  InfoResp({
    required this.id,
    required this.clientId
  });

  factory InfoResp.fromJson(Map<String, dynamic> json) => InfoResp(
    id: json["id"],
    clientId: json["clientId"],
  );
}
