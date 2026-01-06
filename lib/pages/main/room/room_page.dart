import 'package:app/cores/bases/base_auth.dart';
import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/utils/room_util.dart';
import 'package:app/cores/views/info_view.dart';
import 'package:app/ctrls/main/room_ctrl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 聊天页面
class RoomPage extends BaseView<RoomCtrl> {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.title),
        actions: [
          IconButton(
            onPressed: controller.more,
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
    );
  }

  /// 输入内容
  Widget _textEdit(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 40),
      child: TextField(
        focusNode: controller.textNode,
        controller: controller.textCtrl,
        minLines: 1, maxLines: 4,
        decoration: InputDecoration(
          filled: true, isDense: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHigh,
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
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 40,
      child: Builder(
        builder: (btnContext) {
          return GestureDetector(
            onLongPressStart: (_) => controller.voiceStar(),
            onLongPressMoveUpdate: (details) {
              final box = btnContext.findRenderObject() as RenderBox?;
              if (box == null) return;
              final rect = box.localToGlobal(Offset.zero) & box.size;
              final inside = rect.contains(details.globalPosition);
              controller.cancelOnRelease.value = !inside; // 滑出=取消
            },
            onLongPressEnd: (_) async {
              // 松开：根据 cancelOnRelease 决定发/丢
              final send = !controller.cancelOnRelease.value;
              await controller.voiceStop(send: send);
            },
            onLongPressCancel: () => controller.voiceStop(send: false),
            child: Obx(() {
              final rec = controller.recording.value;
              final cancel = controller.cancelOnRelease.value;
              final s = controller.seconds.value;

              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: rec
                      ? (cancel ? Colors.grey.shade400 : scheme.errorContainer)
                      : scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  rec
                      ? (cancel ? '松开取消 ${s}s' : '录音中… ${s}s（上滑取消）')
                      : '按住 说话',
                ),
              );
            }),
          );
        },
      ),
    );
  }

  /// 聊天列表
  Widget _chatList(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          reverse: true,
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
    return Obx(() {
      final info = controller.infoList[index];
      final isMe = info.userId == BaseAuth.id;
      return InfoView(
        isMe: isMe,
        type: info.type,
        name: info.nickname,
        logo: info.logo,
        message: info.message,
        status: info.status,
      );
    });
  }

  /// 菜单列表
  Widget _menuList(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final borderColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    return Container(
      padding: EdgeInsets.only(bottom: bottomSafe, top: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        border: Border(top: BorderSide(color: borderColor, width: 0.2)),
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
            () => AnimatedSize(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
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
    const cols = 4;
    const rowSpacing = 28.0;
    const colSpacing = 28.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemW =
            ((constraints.maxWidth - 28 * 2) - rowSpacing * (cols - 1)) / cols;

        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
          child: Wrap(
            spacing: rowSpacing,
            runSpacing: colSpacing,
            children: List.generate(RoomUtil.moreList.length, (i) {
              return SizedBox(width: itemW, child: _moreMenuItem(context, i));
            }),
          ),
        );
      },
    );
  }

  /// 菜单项目
  Widget _moreMenuItem(BuildContext context, int index) {
    final menu = RoomUtil.moreList[index];
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        controller.media(index);
      },
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 10 / 9,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Center(
                child: Icon(menu.icon, size: 28, color: scheme.primary),
              ),
            ),
          ),
          Text(menu.name),
        ],
      ),
    );
  }

  /// 表情列表
  Widget _faceList(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: RoomUtil.faceList.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: _faceListItem,
        ),

        /// 发送按钮
        Positioned(
          right: 20, bottom: 0,
          child: SizedBox(
            width: 88, height: 48,
            child: ElevatedButton(
              onPressed: () {
                controller.sendText(controller.textCtrl.text);
              },
              child: Text('发送'),
            ),
          ),
        ),
      ],
    );
  }

  /// 表情项目
  Widget _faceListItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        controller.wireFace(RoomUtil.faceList[index]);
      },
      child: Text(RoomUtil.faceList[index], style: TextStyle(fontSize: 28)),
    );
  }
}
