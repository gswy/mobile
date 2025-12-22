
import 'package:app/cores/bases/base_conn.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/model/chat.dart';
import 'package:app/datas/http/apis/chat_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 会话页面
class ChatCtrl extends BaseCtrl {

  /// 页面滚动
  final scroll = ScrollController();

  ///
  final message = ''.obs;

  final loading = false.obs;

  /// 连接状态
  final _conn = Get.find<BaseConn>();

  /// 是否连接
  RxBool get connect => _conn.connect;

  /// 开始请求
  final chatList = <Chat>[].obs;

  /// 当前页数
  final _chatCurr = 1.obs;

  /// 全部页数
  final _chatPage = 1.obs;

  /// 加载会话
  @override void onInit() {
    super.onInit();
    loadChatPage();
    scroll.addListener(() {
      final pos = scroll.position;
      if (pos.pixels >= pos.maxScrollExtent - 200) {
        loadChatPage(page: _chatCurr.value + 1);
      }
    });
  }

  /// 刷新用户
  Future<void> loadChatPage({int page = 1, bool refresh = false}) async {
    if (loading.value) return;

    /// 没有更多页就不请求（可选）
    if (!refresh && _chatPage.value != 0 && page > _chatPage.value) {
      return;
    }

    loading.value = true;
    message.value = '';

    final res = await ChatApis.getChatPage(page: page);
    if (res == null) {
      loading.value = false;
      message.value = '加载失败';
      return;
    }

    /// 设置分页
    _chatCurr.value = res.page;       // 当前页
    _chatPage.value = res.pageNum;    // 总页数

    /// 数据展示
    if (refresh) {
      chatList.value = res.data;
    } else {
      chatList.addAll(res.data);
    }

    loading.value = false;
  }

}