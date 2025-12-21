import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/utils/room_util.dart';
import 'package:app/cores/widgets/chat_view.dart';
import 'package:app/ctrls/main/room_ctrl.dart';
import 'package:app/route/main/main_route.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomPage extends BaseView<RoomCtrl> {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(controller.title.value),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(IconUtil.more),
              iconSize: 18,
            ),
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            controller.hideMoreMenu();
          },
          child: Column(children: [_chatList(context), _menuList(context)]),
        ),
      ),
    );
  }

  /// 输入内容
  Widget _textEdit(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 40),
      child: TextField(
        focusNode: controller.textNode,
        controller: controller.textCtrl,
        minLines: 1,
        maxLines: 4,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Color(0x0f000000),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
        textInputAction: TextInputAction.send,
        onSubmitted: controller.sendText,
      ),
    );
  }

  /// 语音输入
  Widget _talkEdit(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        onLongPress: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text('按住 说话'),
      ),
    );
  }

  /// 聊天列表
  Widget _chatList(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          reverse: true,
          // 反向：最新的在最下面
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          controller: controller.listCtrl,
          itemCount: controller.infoList.length,
          itemBuilder: _chatItem,
        );
      }),
    );
  }

  /// 聊天项目
  Widget _chatItem(BuildContext context, int index) {
    return Placeholder();
    // return Obx(() {
    //   final info = controller.infoList[index];
    //   final mine = info.sourceId == BaseAuth.id;
    //   return ChatView(
    //     mine: mine,
    //     type: info.type,
    //     content: info.content,
    //     status: info.status,
    //   );
    // });
  }

  /// 菜单列表
  Widget _menuList(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.only(bottom: bottomSafe + 8, top: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Column(
        children: [
          // 操作条
          Row(
            children: [
              IconButton(
                onPressed: controller.onTextTap,
                icon: Obx(
                  () => controller.showTextMode.value
                      ? Icon(IconUtil.talk)
                      : Icon(IconUtil.text),
                ),
              ),
              Expanded(
                child: Obx(
                  () => controller.showTextMode.value
                      ? _textEdit(context)
                      : _talkEdit(context),
                ),
              ),
              IconButton(
                onPressed: controller.onFaceTap,
                icon: Icon(IconUtil.emoji),
              ),
              IconButton(
                onPressed: controller.onMoreTap,
                icon: Icon(IconUtil.plus),
              ),
            ],
          ),
          Obx(
            () =>
                (controller.showFaceMode.value || controller.showMoreMenu.value)
                ? Divider(color: Colors.black12, thickness: 0.2)
                : const SizedBox.shrink(),
          ),
          Obx(
            () => AnimatedContainer(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              height: controller.showFaceMode.value ? 240 : 0,
              child: controller.showFaceMode.value
                  ? _faceList(context)
                  : const SizedBox.shrink(),
            ),
          ),
          Obx(
            () => AnimatedContainer(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              height: controller.showMoreMenu.value ? 200 : 0,
              child: controller.showMoreMenu.value
                  ? _moreMenu(context)
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  /// 更多菜单
  Widget _moreMenu(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: RoomUtil.moreList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: _moreMenuItem,
    );
  }

  /// 表情列表
  Widget _faceList(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8, // 一行 8 个（你可以改成 7、6 等）
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: RoomUtil.faceList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: _faceListItem,
    );
  }

  /// 表情项目
  Widget _faceListItem(BuildContext context, int index) {
    return Text(RoomUtil.faceList[index], style: TextStyle(fontSize: 28));
  }

  /// 菜单项目
  Widget _moreMenuItem(BuildContext context, int index) {
    final menu = RoomUtil.moreList[index];
    return GestureDetector(
      onTap: () {
        Get.toNamed(menu.path);
      },
      child: Column(children: [menu.icon, Text(menu.name)]),
    );
  }
}
