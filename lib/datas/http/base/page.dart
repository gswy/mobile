
/// 分页构造
class Page<T> {
  int page;
  int size;
  int pageNum;
  int dataNum;
  List<T> data;

  Page({
    required this.page,
    required this.size,
    required this.pageNum,
    required this.dataNum,
    required this.data,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    page: json["page"],
    size: json["size"],
    pageNum: json["pageNum"],
    dataNum: json["dataNum"],
    data: List<T>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "size": size,
    "pageNum": pageNum,
    "dataNum": dataNum,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}