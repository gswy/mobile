import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/dicts/room_dict.dart';
import 'package:app/datas/http/apis/info_apis.dart';
import 'package:app/datas/http/resp/info/info_team.dart';
import 'package:app/datas/http/resp/info/info_user.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

/// 详细信息
class InfoCtrl extends BaseCtrl {

  /// 远程请求
  final _apis = Get.find<InfoApis>();

  /// -------------- 公共状态 ----------------
  /// 加载说明
  final message = ''.obs;

  /// 是否加载
  final loading = false.obs;

  /// -------------- 用户信息 ----------------
  /// 用户信息
  final user = Rxn<InfoUser>();

  /// 请求用户
  Future<void> initInfoUser() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      user.value = await _apis.getInfoUser(id);
    } catch (e) {
      message.value = '信息获取失败';
    } finally {
      loading.value = false;
    }
  }

  /// -------------- 用户信息 ----------------
  /// 用户信息
  final team = Rxn<InfoTeam>();

  /// 请求用户
  Future<void> initInfoTeam() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      team.value = await _apis.getInfoTeam(id);
    } catch (_) {
      message.value = '信息获取失败';
    } finally {
      loading.value = false;
    }
  }

  /// 跳转聊天
  void handRoom() {
    Get.toNamed(
      MainRoute.room,
      arguments: {'id': user.value!.id, 'mode': RoomDict.mate},
    );
  }

  /// 添加好友
  void handBind() {
    Get.toNamed(
      MainRoute.bindUserForm,
      arguments: {'id': user.value!.id},
    );
  }

}
