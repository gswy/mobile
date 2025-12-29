import 'package:app/cores/drift/enums/info_type.dart';
import 'package:app/cores/utils/host_util.dart';
import 'package:app/cores/views/avatar.dart';
import 'package:app/route/comm/comm_route.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 消息操作
class InfoView extends GetView {

  /// 消息类型
  final InfoType type;

  /// 是否我的消息
  final bool isMe;

  /// 消息状态
  final int status;

  /// 发送人员
  final String name;

  /// 发送头像
  final String? avatar;

  /// 消息内容
  final String message;

  /// 构造信息
  const InfoView({
    super.key,
    required this.type,
    required this.isMe,
    required this.status,
    required this.name,
    this.avatar,
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
          Avatar(url: avatar, name: name, size: 34, textSize: 14),
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
              height: 24,
              width: 24,
              child: Icon(Icons.refresh, color: reCR, size: 16),
            ),
          ),
        ],
        if (status == 0) ...[
          SizedBox(
            height: 14,
            width: 14,
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
                Get.toNamed(CommRoute.images, arguments: message);
              case InfoType.video:
                Get.toNamed(CommRoute.videos, arguments: message);
              case InfoType.voice:
                return;
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(borderRadius: meRA, color: meBG),
            constraints: BoxConstraints(maxWidth: Get.width * 0.65),
            child: GestureDetector(onLongPress: () {}, child: child),
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
    return ExtendedImage.network(
      '${HostUtil.getHttp()}$message',
      fit: BoxFit.cover,
      cache: true,
    );
  }

  /// 图片显示
  Widget _video(BuildContext context) {
    return ExtendedImage.network(
      '${HostUtil.getHttp()}$message',
      fit: BoxFit.cover,
      cache: true,
    );
  }

  /// 图片显示
  Widget _voice(BuildContext context) {
    return ExtendedImage.network(
      '${HostUtil.getHttp()}$message',
      fit: BoxFit.cover,
      cache: true,
    );
  }
}
