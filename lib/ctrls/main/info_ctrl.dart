import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/value/room_constants.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/datas/hive/mapper/mate_hive.dart';
import 'package:app/datas/http/apis/info_apis.dart';
import 'package:app/route/main/main_route.dart';
import 'package:get/get.dart';

class InfoCtrl extends BaseCtrl {

  final _hive = Get.find<MateHive>();

  final _apis = Get.find<InfoApis>();

  /// 用户信息
  final mate = Rxn<Mate>();

  @override
  void onInit() {
    super.onInit();
    _initialized();
  }

  /// 初始化数据
  Future<void> _initialized() async {
    try {
      mate.value = await _apis.getMate(id);
    } catch (_) {
      mate.value = _hive.get(id);
    }
  }

  /// 跳转聊天
  void handRoom() {
    Get.toNamed(
      MainRoute.room,
      arguments: {'id': mate.value?.id, 'mode': RoomConstants.roomMate},
    );
  }
}
