class FileResp {
  String head;
  String path;

  FileResp({required this.head, required this.path});

  factory FileResp.fromJson(dynamic json) =>
      FileResp(head: json["head"], path: json["path"]);

  Map<String, dynamic> toJson() => {"head": head, "path": path};
}
