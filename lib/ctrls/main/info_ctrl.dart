import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/utils/chat_util.dart';
import 'package:app/datas/http/apis/team_apis.dart';
import 'package:app/datas/http/apis/user_apis.dart';
import 'package:app/datas/http/resp/team/team_info.dart';
import 'package:app/datas/http/resp/user/user_info.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

/// 详细信息
class InfoCtrl extends BaseCtrl {
  /// -------------- 公共状态 ----------------

  /// 加载说明
  final message = ''.obs;

  /// 是否加载
  final loading = false.obs;

  /// -------------- 用户信息 ----------------

  /// 用户信息
  final user = Rxn<UserInfo>();

  /// 请求用户
  Future<void> initInfoUser() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      user.value = await UserApis.getUserInfo(id);
    } catch (e) {
      message.value = '信息获取失败';
    } finally {
      loading.value = false;
    }
  }



  /// -------------- 群组信息 ----------------
  /// 用户信息
  final team = Rxn<TeamInfo>();

  /// 请求用户
  Future<void> initInfoTeam() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      team.value = await TeamApis.getTeamInfo(id);
    } catch (_) {
      message.value = '信息获取失败';
    } finally {
      loading.value = false;
    }
  }

  /// 跳转聊天
  void handRoom() {
    String sn = '';
    String name = '';
    int targetId = 0;
    ChatType type = ChatType.mate;
    if (user.value != null) {
      sn = ChatUtil.getSN(BaseAuth.id!, user.value!.id);
      name = user.value!.nickname;
      targetId = user.value!.id;
      type = ChatType.mate;
    }
    if (team.value != null) {
      sn = ChatUtil.getSN(BaseAuth.id!, team.value!.id);
      name = team.value!.name;
      targetId = team.value!.id;
      type = ChatType.team;
    }
    Get.toNamed(
      MainRoute.room,
      arguments: {'sn': sn, 'type': type, 'title': name, 'targetId': targetId},
    );
  }

  /// 添加好友
  void handBind() {
    Get.toNamed(MainRoute.bindUserForm, arguments: {'id': user.value!.id});
  }
}
