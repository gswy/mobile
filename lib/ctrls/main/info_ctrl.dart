import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/cores/utils/chat_util.dart';
import 'package:app/datas/http/apis/mate_apis.dart';
import 'package:app/datas/http/apis/team_apis.dart';
import 'package:app/datas/http/apis/user_apis.dart';
import 'package:app/datas/http/resp/team/team_info.dart';
import 'package:app/datas/http/resp/user/user_info.dart';
import 'package:app/model/mate.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// 详细信息
class InfoCtrl extends BaseCtrl {
  /// -------------- 公共状态 ----------------

  /// 加载说明
  final message = ''.obs;

  /// 是否加载
  final loading = false.obs;

  /// 选择头像
  final picker = ImagePicker();

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

  /// 我的好友列表
  final users = <MateList>[].obs;

  /// 好友滚动列表
  final usersScroll = ScrollController();

  /// 加载好友
  Future<void> loadUsers({int page = 1}) async {
    final res = await MateApis.getMatePage(page: page);
    if (res == null) {
      Toast.error('加载失败');
      return;
    }
    if (page == 1) {
      users.value = res.data;
    } else {
      users.addAll(res.data);
    }
  }

  /// 请求用户
  Future<void> initInfoTeam() async {
    loading.value = true;
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    try {
      team.value = await TeamApis.getTeamInfo(id);
    } catch (e) {
      message.value = '信息获取失败';
    } finally {
      loading.value = false;
    }
  }

  /// 处理禁言
  Future<void> handMute() async {
    try {
      final args = Get.arguments as Map;
      final id = args['id'] as int;
      await TeamApis.handMute(id);
      team.value = await TeamApis.getTeamInfo(id);
    } catch (_) {}
  }

  /// 修改群名
  Future<void> handName(String name) async {
    try {
      final args = Get.arguments as Map;
      final id = args['id'] as int;
      await TeamApis.handName(id, name);
      team.value = await TeamApis.getTeamInfo(id);
    } catch (_) {}
  }

  /// 修改头像
  Future<void> handLogo() async {
    try {
      final args = Get.arguments as Map;
      final id = args['id'] as int;
      final file = await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
      if (file == null) return;
      await TeamApis.handLogo(id, file);
      team.value = await TeamApis.getTeamInfo(id);
    } catch (_) { }
  }

  /// 添加群友
  Future<void> addTeamUser(List<int> ids) async {
    try {
      final args = Get.arguments as Map;
      final id = args['id'] as int;
      await TeamApis.addTeamUser(id, ids);
      team.value = await TeamApis.getTeamInfo(id);
    } catch (_) { }
  }

  /// -------------- 公共跳转 ----------------

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
