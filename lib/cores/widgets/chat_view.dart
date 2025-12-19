import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/cores/dicts/chat_dict.dart';

class ChatView extends GetView {
  /// 是否我的消息
  final bool mine;

  /// 消息类型（改为 int，和 ChatDict 对齐）
  final int type;

  /// 消息内容
  final String content;

  /// 消息状态：-1失败 / 0发送中 / 1成功
  final int status;

  /// 发送人员
  final String? name;

  /// 发送头像
  final String? avatar;

  /// 重发回调（仅 status=-1 且 mine=true 时会用到）
  final VoidCallback? onResend;

  /// 文件点击回调（type=file 时可用）
  final VoidCallback? onTapFile;

  const ChatView({
    super.key,
    required this.mine,
    required this.type,
    required this.content,
    required this.status,
    this.name,
    this.avatar,
    this.onResend,
    this.onTapFile,
  });

  @override
  Widget build(BuildContext context) {
    final showName = name != null && name!.trim().isNotEmpty;

    final rowChildren = <Widget>[
      _avatar(),
      _gapW(10),
      Expanded(
        child: Column(
          crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (showName)
              Padding(
                padding: EdgeInsets.only(
                  left: mine ? 0 : 6,
                  right: mine ? 6 : 0,
                  bottom: 4,
                ),
                child: Text(
                  name!.trim(),
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ),

            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: mine
                  ? [
                _statusWidget(),
                if (_shouldShowStatus()) _gapW(6),
                Flexible(child: _body(context)),
              ]
                  : [
                Flexible(child: _body(context)),
              ],
            ),
          ],
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: mine ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: mine ? rowChildren.reversed.toList() : rowChildren,
      ),
    );
  }

  Widget _gapW(double w) => SizedBox(width: w);
  Widget _gapH(double h) => SizedBox(height: h);

  bool _shouldShowStatus() => mine && (status == 0 || status == -1);

  /// 状态控件：失败=重发按钮；发送中=loading；成功=不显示
  Widget _statusWidget() {
    if (!mine) return const SizedBox.shrink();

    if (status == 0) {
      return const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (status == -1) {
      return InkWell(
        onTap: onResend,
        borderRadius: BorderRadius.circular(99),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            Icons.refresh,
            size: 18,
            color: Colors.red.shade400,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  /// 头像
  Widget _avatar() {
    final hasAvatar = avatar != null && avatar!.trim().isNotEmpty;

    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.grey.shade300,
      backgroundImage: hasAvatar ? NetworkImage(avatar!.trim()) : null,
      child: hasAvatar
          ? null
          : Icon(
        Icons.person,
        size: 18,
        color: Colors.grey.shade700,
      ),
    );
  }

  /// 消息内容分发（新增 file）
  Widget _body(BuildContext context) {
    switch (type) {
      case ChatDict.text:
        return _text(context);
      case ChatDict.file:
        return _file(context);
      case ChatDict.card:
        return _card(context);
      case ChatDict.image:
        return _image(context);
      case ChatDict.video:
        return _video(context);
      case ChatDict.voice:
        return _voice(context);
      default:
        return _unknown(context);
    }
  }

  /// 通用气泡容器
  Widget _bubble({
    required BuildContext context,
    required Widget child,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  }) {
    final bg = mine ? const Color(0xFFDCF8C6) : Colors.white;
    final border = Colors.grey.shade300;

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.72,
      ),
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(color: border),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(14),
          topRight: const Radius.circular(14),
          bottomLeft: Radius.circular(mine ? 14 : 2),
          bottomRight: Radius.circular(mine ? 2 : 14),
        ),
      ),
      child: child,
    );
  }

  Widget _unknown(BuildContext context) {
    return _bubble(
      context: context,
      child: Text(
        '不支持的消息类型：$type',
        style: TextStyle(fontSize: 13, color: Colors.red.shade400),
      ),
    );
  }

  /// 文字消息
  Widget _text(BuildContext context) {
    return _bubble(
      context: context,
      child: Text(
        content,
        style: const TextStyle(fontSize: 15, height: 1.3),
      ),
    );
  }

  /// 文件消息（content 约定： "文件名|大小|url"；不符合就只显示 content）
  Widget _file(BuildContext context) {
    String fileName = content;
    String fileSize = '';
    String fileUrl = '';

    final parts = content.split('|');
    if (parts.isNotEmpty) fileName = parts[0].trim().isEmpty ? content : parts[0].trim();
    if (parts.length >= 2) fileSize = parts[1].trim();
    if (parts.length >= 3) fileUrl = parts[2].trim();

    return _bubble(
      context: context,
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTapFile ??
                () {
              // 你可以在这里根据 fileUrl 打开下载页/预览页
              // debugPrint('tap file: $fileUrl');
            },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.insert_drive_file, size: 26, color: Colors.blueGrey.shade600),
              _gapW(10),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    if (fileSize.isNotEmpty) ...[
                      _gapH(4),
                      Text(
                        fileSize,
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                    if (fileUrl.isNotEmpty) ...[
                      _gapH(6),
                      Text(
                        '点击查看',
                        style: TextStyle(fontSize: 12, color: Colors.blue.shade600),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 卡片消息
  Widget _card(BuildContext context) {
    String title = '卡片';
    String desc = content;

    final parts = content.split('|');
    if (parts.length >= 2) {
      title = parts[0].trim().isEmpty ? title : parts[0].trim();
      desc = parts.sublist(1).join('|').trim();
    }

    return _bubble(
      context: context,
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              _gapH(6),
              Text(
                desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.25),
              ),
              _gapH(10),
              Divider(height: 1, color: Colors.grey.shade300),
              _gapH(10),
              Text('查看详情', style: TextStyle(fontSize: 13, color: Colors.blue.shade600)),
            ],
          ),
        ),
      ),
    );
  }

  /// 图片消息
  Widget _image(BuildContext context) {
    return _bubble(
      context: context,
      padding: const EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          content,
          fit: BoxFit.cover,
          loadingBuilder: (c, w, p) {
            if (p == null) return w;
            return const SizedBox(
              width: 180,
              height: 140,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          },
          errorBuilder: (c, e, s) => const SizedBox(
            width: 180,
            height: 140,
            child: Center(child: Icon(Icons.broken_image)),
          ),
        ),
      ),
    );
  }

  /// 视频消息（占位）
  Widget _video(BuildContext context) {
    return _bubble(
      context: context,
      padding: const EdgeInsets.all(6),
      child: Container(
        width: 220,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                '视频',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              ),
            ),
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
    );
  }

  /// 语音消息（占位）
  Widget _voice(BuildContext context) {
    String durationText = '';
    String showText = content;

    final parts = content.split('|');
    if (parts.length >= 2) {
      durationText = parts[0].trim();
      showText = '语音消息';
    }

    final barWidth = (mine ? 180.0 : 160.0);

    return _bubble(
      context: context,
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(mine ? Icons.volume_up : Icons.volume_down, size: 18, color: Colors.grey.shade800),
            _gapW(8),
            Container(
              width: barWidth,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            _gapW(10),
            Text(
              durationText.isNotEmpty ? '${durationText}s' : showText,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
