
import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/datas/serv/conn_serv.dart';
import 'package:app/model/chat.dart';
import 'package:app/datas/http/apis/chat_apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// 会话页面
class ChatCtrl extends BaseCtrl {

  /// 页面滚动
  final scroll = ScrollController();

  /// 加载结果
  final message = ''.obs;

  /// 加载状态
  final loading = false.obs;

  /// 连接信息
  final _conn = Get.find<ConnServ>();

  /// 连接状态
  String get subtitle {
    if (loading.value) {
      return '收取中';
    }
    return _conn.message.value;
  }

  /// 开始请求
  final chatList = <Chat>[].obs;

  /// 当前页数
  final _chatCurr = 1.obs;

  /// 全部页数
  final _chatPage = 1.obs;

  /// 加载会话
  @override void onInit() {
    super.onInit();
    /// 监听数据变化
    DB.dao.listChat(BaseAuth.id!).listen((data) {
      chatList.assignAll(data);
      chatList.refresh();
    });
    /// 监听页面滚动
    scroll.addListener(() {
      final pos = scroll.position;
      if (pos.pixels >= pos.maxScrollExtent - 200) {
        loadChatPage(page: _chatCurr.value + 1);
      }
    });
    loadChatPage();
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
    DB.dao.saveChatList(res.data);

    loading.value = false;
  }

}