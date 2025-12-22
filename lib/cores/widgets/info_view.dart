
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 消息操作
class InfoView extends GetView {
  /// 消息类型
  final int type;

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
          CircleAvatar(child: Text(name.substring(0, 1))),
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (status == -1)
          GestureDetector(
            onTap: () async {
              Get.log('重发');
            },
            child: SizedBox(height: 24, width: 24, child: Icon(Icons.refresh, color: reCR, size: 16)),
          ),
        if (status == 0)
          SizedBox(height: 14, width: 14, child: CircularProgressIndicator(strokeWidth: 1.4)),
        /// 主体内容
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(borderRadius: meRA, color: meBG),
          constraints: BoxConstraints(maxWidth: Get.width * 0.65),
          child: GestureDetector(onLongPress: () {}, child: _text(context)),
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
    return CircleAvatar();
  }
}
