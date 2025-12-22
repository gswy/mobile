
import 'package:app/cores/model/mine.dart';
import 'package:app/datas/http/apis/mine_apis.dart';
import 'package:get/get.dart';

class BaseAuth extends GetxService {

  /// 用户信息
  static final _mine = Rxn<Mine>(null);

  /// 用户标识
  static int? get id => _mine.value?.id;

  /// 用户信息
  static Mine? get mine => _mine.value;

  /// 用户头像
  static String? get avatar => _mine.value?.avatar;

  /// 用户昵称
  static String? get nickname => _mine.value?.nickname;

  /// 初始获取
  Future<void> init () async {
    final mine = await MineApis.getMine();
    _mine.value = mine;
  }

}