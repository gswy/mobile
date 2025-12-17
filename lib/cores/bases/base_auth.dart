
import 'package:app/datas/hive/entity/mine.dart';
import 'package:app/datas/http/apis/mine_apis.dart';
import 'package:get/get.dart';

class BaseAuth extends GetxService {

  /// 全局单例
  static BaseAuth get to => Get.find<BaseAuth>();

  /// 请求服务
  final _apis = Get.find<MineApis>();

  /// 用户信息
  final _mine = Rxn<Mine>(null);

  /// 用户ID（静态获取）
  static int? get id => to._mine.value?.id;

  /// 初始获取
  Future<void> init () async {
    _mine.value = await _apis.getMine();
  }

}