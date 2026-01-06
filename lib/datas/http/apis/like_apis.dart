import 'package:app/cores/bases/base_http.dart';
import 'package:app/model/like.dart';
import 'package:app/model/mate.dart';
import 'package:get/get.dart';

/// 好友接口
class LikeApis {
  LikeApis._();

  static final _http = Get.find<BaseHttp>();

  /// 获取用户列表
  static Future<Page<LikeList>> getLikePage({int page = 1}) async {
    return await _http.getPage<LikeList>(
      '/likes',
      query: {'page': page},
      fromJson: LikeList.fromJson,
    );
  }
}
