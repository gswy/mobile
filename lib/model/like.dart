
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';

class LikeList {
  final int id;
  final ChatType mode;
  final InfoType type;
  final String? logo;
  final String name;
  final String body;
  final int sourcedAt;
  final int createdAt;

  LikeList({
    required this.id,
    required this.mode,
    required this.type,
    required this.logo,
    required this.name,
    required this.body,
    required this.sourcedAt,
    required this.createdAt,
  });

  /// json转换
  factory LikeList.fromJson(Map<String, dynamic> json) => LikeList(
    id: json["id"],
    mode: ChatType.fromCode(json['mode']),
    type: InfoType.fromCode(json['type']),
    logo: json["logo"],
    name: json["name"],
    body: json["body"],
    sourcedAt: json["sourcedAt"],
    createdAt: json["createdAt"],
  );

}