
class InfoResp {

  final int id;

  InfoResp({required this.id});

  factory InfoResp.fromJson(dynamic json) => InfoResp(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };

}