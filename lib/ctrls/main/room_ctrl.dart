import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/dicts/room_dict.dart';
import 'package:app/datas/hive/entity/chat.dart';
import 'package:app/datas/hive/entity/info.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/datas/hive/entity/team.dart';
import 'package:app/datas/hive/mapper/chat_hive.dart';
import 'package:app/datas/hive/mapper/info_hive.dart';
import 'package:app/datas/hive/mapper/mate_hive.dart';
import 'package:app/datas/hive/mapper/team_hive.dart';
import 'package:app/datas/http/apis/room_apis.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// 房间数据
class RoomCtrl extends BaseCtrl {
  /// 持久存储
  final _chatHive = Get.find<ChatHive>();

  /// 持久存储
  final _mateHive = Get.find<MateHive>();

  /// 持久存储
  final _infoHive = Get.find<InfoHive>();

  /// 持久存储
  final _teamHive = Get.find<TeamHive>();

  /// 房间接口
  final _apis = Get.find<RoomApis>();

  /// 房间类型
  final _mode = 0.obs;

  /// 好友信息
  final _mate = Rxn<Mate>();

  /// 群组信息
  final _team = Rxn<Team>();

  /// 聊天标题
  String get name =>
      _mode.value == 0 ? _mate.value!.nickname : _team.value!.name;

  /// 响应聊天
  List<Info> get infoList => _infoList();

  /// 是否显示键盘输入
  final showTextMode = true.obs;

  /// 是否显示表情输入
  final showFaceMode = false.obs;

  /// 是否显示菜单选择
  final showMoreMenu = false.obs;

  /// 列表控制器
  final listCtrl = ScrollController();

  /// 输入控制器
  final textNode = FocusNode();
  final textCtrl = TextEditingController();

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  /// 初始化聊天列表
  Future<void> _init() async {
    final args = Get.arguments as Map;
    final id = args['id'] as int;
    _mode.value = args['mode'] as int;

    /// 新建好友会话
    if (_mode.value == RoomDict.mate) {
      _mate.value = _mateHive.get(id);
      if (_mate.value != null) {
        _chatHive.add(
          Chat(
            id: id,
            mode: _mode.value,
            name: _mate.value!.nickname,
            avatar: _mate.value!.avatar,
            unread: 0,
          ),
        );
      }
    }

    /// 新建群组会话
    if (_mode.value == RoomDict.team) {
      _team.value = _teamHive.get(id);
      if (_team.value != null) {
        _chatHive.add(
          Chat(
            id: id,
            mode: _mode.value,
            name: _team.value!.name,
            avatar: _team.value!.avatar,
            unread: 0,
          ),
        );
      }
    }
  }

  /// 发送文字消息
  Future<void> sendText(String text) async {
    final args = Get.arguments as Map;
    final id = args['id'] as int;

    /// 清空内容 && 取消键盘
    textCtrl.clear();
    FocusScope.of(Get.context!).unfocus();

    /// 构造入库数据
    final now = DateTime.now();
    final createdAt = now.millisecondsSinceEpoch;
    final sourcedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    final targetId = _mode.value == 0 ? _mate.value?.id : _team.value?.id;
    final sourceId = BaseAuth.id ?? 0;

    /// 发送消息
    final info = Info(
      mode: _mode.value,
      sourceId: sourceId,
      targetId: targetId!,
      status: 0,
      type: 0,
      content: text,
      sourcedAt: createdAt,
    );

    /// 进行入库数据
    final key = await _infoHive.add(info);

    /// 尝试发送消息
    try {
      if (_mode.value == 0) {
        final res = await RoomApis.sendMateText(
          type: 0,
          targetId: _mate.value!.id,
          content: text,
          sourcedAt: sourcedAt,
        );

        /// 发送成功修改消息状态
        info.id = res?.id;
        info.status = 1;
        await _infoHive.put(key, info);
      }
      if (_mode.value == 1) {
        final res = await RoomApis.sendTeamText(
          type: 0,
          targetId: _team.value!.id,
          content: text,
          sourcedAt: sourcedAt,
        );

        /// 发送成功修改消息状态
        info.id = res?.id;
        info.status = 1;
        await _infoHive.put(key, info);
      }
    } catch (_) {
      /// 发送失败修改消息状态
      info.status = -1;
      await _infoHive.put(key, info);
    }
  }

  /// 撤回消息

  /// 过滤数据
  List<Info> _infoList() {
    /// 消息过滤
    final infos = _infoHive.infos;
    if (_mode.value == RoomDict.mate) {
      final res = infos.where((it) {
        return (it.targetId == _mate.value?.id ||
                it.sourceId == _mate.value?.id) &&
            it.mode == RoomDict.mate;
      }).toList();

      /// 排序
      res.sort((a, b) => b.sourcedAt.compareTo(a.sourcedAt));
      return res;
    }

    if (_mode.value == RoomDict.team) {
      final res = infos.where((it) {
        return (it.targetId == _team.value?.id ||
                it.sourceId == _team.value?.id) &&
            it.mode == RoomDict.team;
      }).toList();

      /// 排序
      res.sort((a, b) => b.sourcedAt.compareTo(a.sourcedAt));
      return res;
    }
    return const [];
  }

  /// 切换显示/隐藏九宫格菜单
  void toggleMoreMenu() {
    showMoreMenu.value = !showMoreMenu.value;
    if (showMoreMenu.value) {
      // 隐藏键盘
      FocusScope.of(Get.context!).unfocus();
    }
  }

  /// 隐藏九宫格菜单
  void hideMoreMenu() {
    FocusScope.of(Get.context!).unfocus();
    showFaceMode.value = false;
    showMoreMenu.value = false;
  }

  /// 处理菜单项点击
  void onMenuTap(String type) {
    hideMoreMenu();
    switch (type) {
      case 'image':
        // 选择照片
        break;
      case 'camera':
        // 拍摄
        break;
      case 'file':
        // 选择文件
        break;
    }
  }

  /// 切换语音/键盘模式
  void onTextTap() {
    if (showTextMode.value) {
      FocusScope.of(Get.context!).unfocus();
      showTextMode.value = false;
    } else {
      showTextMode.value = true;
      textNode.requestFocus();
    }
    showFaceMode.value = false;
    showMoreMenu.value = false;
  }

  /// 切换表情
  void onFaceTap() {
    if (showFaceMode.value) {
      FocusScope.of(Get.context!).unfocus();
      showFaceMode.value = false;
    } else {
      FocusScope.of(Get.context!).unfocus();
      showFaceMode.value = true;
    }
    showMoreMenu.value = false;
  }

  /// 切换更多
  void onMoreTap() {
    FocusScope.of(Get.context!).unfocus();
    showFaceMode.value = !showFaceMode.value;
    showFaceMode.value = false;
    showMoreMenu.value = true;
  }

  @override
  void onClose() {
    textCtrl.dispose();
    super.onClose();
  }
}
