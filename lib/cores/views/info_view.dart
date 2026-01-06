import 'dart:convert';

import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/cores/utils/host_util.dart';
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/cores/views/user_logo.dart';
import 'package:app/datas/http/resp/file/file_resp.dart';
import 'package:app/route/comm/comm_route.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 消息操作
class InfoView extends GetView {
  /// 消息类型
  final InfoType type;

  /// 是否我的消息
  final bool isMe;

  /// 发送人员
  final String name;

  /// 消息状态
  final int status;

  /// 发送头像
  final String? logo;

  /// 消息内容
  final String message;

  /// 播放组件
  static final AudioPlayer _player = AudioPlayer();

  /// 构造信息
  const InfoView({
    super.key,
    required this.type,
    required this.isMe,
    required this.name,
    required this.status,
    this.logo,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final meDR = isMe ? TextDirection.rtl : TextDirection.ltr;
    final meCA = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        textDirection: meDR,
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserLogo(url: logo, name: name, size: 34, textSize: 14),
          Column(
            spacing: 4,
            crossAxisAlignment: meCA,
            children: [
              Text(name, style: TextStyle(fontSize: 12)),
              _item(context),
            ],
          ),
        ],
      ),
    );
  }

  /// 聊天子项
  Widget _item(BuildContext context) {
    final meRA = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )
        : BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          );
    final meBG = isMe
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.secondaryContainer;

    final reCR = Theme.of(context).colorScheme.error;

    /// 分发信息
    final child = switch (type) {
      InfoType.text => _text(context),
      InfoType.file => Placeholder(),
      InfoType.card => Placeholder(),
      InfoType.image => _image(context),
      InfoType.video => _video(context),
      InfoType.voice => _voice(context),
    };

    ///
    final width = switch (type) {
      InfoType.text => Get.width * 0.65,
      InfoType.file => Get.width * 0.65,
      InfoType.card => Get.width * 0.65,
      InfoType.image => Get.width * 0.35,
      InfoType.video => Get.width * 0.35,
      InfoType.voice => Get.width * 0.20,
    };

    ///
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 6,
      children: [
        if (status == -1) ...[
          GestureDetector(
            onTap: () async {
              Get.log('重发');
            },
            child: SizedBox(
              height: 24, width: 24,
              child: Icon(Icons.refresh, color: reCR, size: 16),
            ),
          ),
        ],
        if (status == 0) ...[
          SizedBox(
            height: 14, width: 14,
            child: CircularProgressIndicator(strokeWidth: 1.4),
          ),
        ],

        /// 主体内容
        GestureDetector(
          onTap: () {
            switch (type) {
              case InfoType.text:
                return;
              case InfoType.file:
                return;
              case InfoType.card:
                return;
              case InfoType.image:
                final file = FileResp.fromJson(jsonDecode(message));
                Get.toNamed(CommRoute.images, arguments: file.path);
              case InfoType.video:
                final file = FileResp.fromJson(jsonDecode(message));
                Get.toNamed(CommRoute.videos, arguments: file.path);
              case InfoType.voice:
                final info = jsonDecode(message);
                _player.play(UrlSource('${HostUtil.getHttp()}${info['path']}'));
                return;
            }
          },
          behavior: HitTestBehavior.opaque,
          // onLongPressStart: (d) {
          //   _showMenu(context, d.globalPosition);
          // },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(borderRadius: meRA, color: meBG),
            constraints: BoxConstraints(maxWidth: width),
            child: child,
          ),
        ),
      ],
    );
  }

  /// 文字显示
  Widget _text(BuildContext context) {
    return Text(message, style: TextStyle(fontSize: 16));
  }

  /// 图片显示
  Widget _image(BuildContext context) {
    final file = FileResp.fromJson(jsonDecode(message));
    final cache = '${HostUtil.getHttp()}${file.head}';
    final cacheKey = keyToMd5(cache);
    return ExtendedImage.network(
      cache,
      fit: BoxFit.cover,
      cache: true,
      cacheKey: cacheKey,
    );
  }

  /// 视频显示
  Widget _video(BuildContext context) {
    final file = FileResp.fromJson(jsonDecode(message));
    final cache = '${HostUtil.getHttp()}${file.head}';
    final cacheKey = keyToMd5(cache);
    return Stack(
      children: [
        ExtendedImage.network(
          cache,
          fit: BoxFit.cover,
          cache: true,
          cacheKey: cacheKey,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Icon(IconUtil.playFull, size: 50),
          ),
        ),
      ],
    );
  }

  /// 音频显示
  Widget _voice(BuildContext context) {
    final info = jsonDecode(message);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text('${info['duration']}'),
        Icon(IconUtil.roomVoice),
      ],
    );
  }


  Future<void> _showMenu(BuildContext context, Offset globalPos) async {
    final overlay = Overlay.of(context, rootOverlay: true).context.findRenderObject() as RenderBox;
    final size = overlay.size;

    // 构建菜单项
    final actions = <_MsgAction>[];

    if (type == InfoType.text) {
      actions.add(_MsgAction('复制', 'copy'));
    }
    if (type == InfoType.voice) {
      actions.add(_MsgAction('播放', 'play'));
    }
    actions.add(_MsgAction('转发', 'forward'));
    actions.add(_MsgAction('删除', 'delete'));

    if (actions.isEmpty) return;

    // 菜单尺寸估算：每个 item 约 64 宽，padding 若干
    const itemW = 64.0;
    const menuH = 44.0;
    final menuW = actions.length * itemW;

    // 计算菜单左上角位置：默认在手指上方一点
    double left = globalPos.dx - menuW / 2;
    double top = globalPos.dy - menuH - 12;

    // 边界修正（别出屏幕）
    left = left.clamp(8.0, size.width - menuW - 8.0);
    top = top.clamp(8.0, size.height - menuH - 8.0);

    final result = await showGeneralDialog<String>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'msg_menu',
      barrierColor: Colors.transparent, // 不要全屏变暗（更像微信）
      transitionDuration: const Duration(milliseconds: 120),
      pageBuilder: (_, _, _) {
        return Stack(
          children: [
            // 透明点击层：点空白关闭
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Get.back(result: null),
                child: const SizedBox.shrink(),
              ),
            ),

            // 菜单本体
            Positioned(
              left: left,
              top: top,
              child: _HorizontalMenu(
                actions: actions,
                width: menuW,
                height: menuH,
                onSelected: (v) => Get.back(result: v),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (_, anim, __, child) {
        final a = CurvedAnimation(parent: anim, curve: Curves.easeOut);
        return FadeTransition(
          opacity: a,
          child: ScaleTransition(scale: Tween(begin: 0.95, end: 1.0).animate(a), child: child),
        );
      },
    );

    if (result == null) return;

    switch (result) {
      case 'copy':
      // Clipboard.setData(ClipboardData(text: message));
      //   Toast.success('已复制');
        break;
      case 'play':
        if (type == InfoType.voice) {
          final info = jsonDecode(message);
          await _player.stop();
          await _player.play(UrlSource('${HostUtil.getHttp()}${info['path']}'));
        }
        break;
      case 'forward':
        // Toast.success('转发');
        break;
      case 'delete':
        // Toast.success('删除');
        break;
    }
  }




}

class _MsgAction {
  final String label;
  final String value;
  _MsgAction(this.label, this.value);
}

class _HorizontalMenu extends StatelessWidget {
  final List<_MsgAction> actions;
  final double width;
  final double height;
  final ValueChanged<String> onSelected;

  const _HorizontalMenu({
    required this.actions,
    required this.width,
    required this.height,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.72), // ✅ 半透明
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(actions.length * 2 - 1, (i) {
            // 奇数位置放分割线
            if (i.isOdd) {
              return Container(
                width: 1,
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.white.withOpacity(0.25), // ✅ 分割线
              );
            }

            final action = actions[i ~/ 2];
            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onSelected(action.value),
                child: Center(
                  child: Text(
                    action.label,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}