
import 'package:app/model/mine.dart';
import 'package:app/datas/http/apis/mine_apis.dart';
import 'package:get/get.dart';

class BaseAuth extends GetxService {

  /// 用户信息
  static final mine = Rxn<Mine>(null);

  /// 用户标识
  static int? get id => mine.value?.id;

  /// 用户头像
  static String? get avatar => mine.value?.avatar;

  /// 用户昵称
  static String? get nickname => mine.value?.nickname;

  /// 用户账号
  static String? get username => mine.value?.username;

  /// 初始获取
  Future<void> init () async {
    mine.value = await MineApis.getMine();
  }

}