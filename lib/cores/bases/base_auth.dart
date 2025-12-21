
import 'package:app/cores/model/mine.dart';
import 'package:app/datas/http/apis/mine_apis.dart';
import 'package:get/get.dart';

class BaseAuth extends GetxService {

  /// 全局单例
  static BaseAuth get to => Get.find<BaseAuth>();

  /// 用户信息
  final _mine = Rxn<Mine>(null);

  /// 用户ID（静态获取）
  static int? get id => null;

  /// 用户信息
  static Mine? get mine => to._mine.value;

  /// 用户昵称


  /// 初始获取
  Future<void> init () async {
    _mine.value = await MineApis.getMine();
  }

}