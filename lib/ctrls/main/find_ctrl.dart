import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/value/room_constants.dart';
import 'package:app/datas/http/resp/find/find_user.dart';
import 'package:app/datas/http/apis/find_apis.dart';
import 'package:app/route/main/main_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 搜索控制
class FindCtrl extends BaseCtrl {
  /// 远程请求
  final _resp = Get.find<FindApis>();

  /// 输入焦点
  final focus = FocusNode();

  /// 输入控制器
  final input = TextEditingController();

  /// 是否加载中
  final loading = false.obs;

  /// 是否已加载
  final message = ''.obs;

  /// 是否已搜索
  final finished = false.obs;

  /// 是否获取焦点
  final hasFocus = false.obs;

  /// 当前页码
  final page = 1.obs;

  /// 每页大小
  final size = 10.obs;

  /// 数据总量
  final dataNum = 0.obs;

  /// 页码总量
  final pageNum = 0.obs;

  /// 结束
  final down = false.obs;

  /// 搜索列表
  final list = <FindUser>[].obs;

  @override
  void onInit() {
    super.onInit();
    // 监听焦点变化
    focus.addListener(() {
      hasFocus.value = focus.hasFocus;
    });
  }

  /// 搜索用户
  Future<void> search(String? text) async {
    if (text == null) return;
    final search = text.trim();
    if (search.isEmpty) return;
    loading.value = true;
    try {
      final page = await _resp.search(text);
      list.value = page.data;
      if (list.isEmpty) {
        message.value = '暂无数据';
      } else {
        message.value = '';
      }
    } catch (_) {
      message.value = '搜索失败';
    } finally {
      loading.value = false;
    }
  }

  /// 绑定用户
  Future<void> bindUser(int id) async {
    final user = list.firstWhereOrNull((it) => it.id == id);
    if (user != null) {
      Get.toNamed(MainRoute.bindForm, arguments: {"id": user.id, 'type': RoomConstants.roomMate});
    }
  }

  /// 清理资源
  @override
  void onClose() {
    focus.dispose();
    input.dispose();
    super.onClose();
  }
}
