class FileResp {
  String filepath;

  FileResp({required this.filepath});

  factory FileResp.fromJson(dynamic json) =>
      FileResp(filepath: json["filepath"]);

  Map<String, dynamic> toJson() => {"filepath": filepath};
}
