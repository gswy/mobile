
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/model/team.dart';
import 'package:app/datas/http/apis/team_apis.dart';
import 'package:get/get.dart';

/// 群组列表
class TeamCtrl extends BaseCtrl {

  /// 加载信息
  final message = ''.obs;

  /// 加载状态
  final loading = false.obs;

  /// 群组列表
  final teamList = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    TeamApis.getTeamPage(page: 1);
  }


}