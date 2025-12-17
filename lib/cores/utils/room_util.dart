
import 'package:app/cores/utils/icon_util.dart';
import 'package:app/route/comm/comm_route.dart';
import 'package:flutter/material.dart';

class RoomUtil {
  RoomUtil._();

  static final faceList = [
    '😀', '😁', '🤣', '😂', '😄', '😅', '😆', '😇', '😉', '😊', '🙂', '🙃',
    '😋', '😌', '😍', '😘', '😙', '😜', '😝', '🤑', '🤓', '😎', '🤗', '🤡',
    '🤠', '😏', '😶', '😑', '😒', '🙄', '🤔', '😳', '😞', '😟', '😠', '😡',
    '😔', '😕', '😣', '😖', '😫', '😤', '😮', '😱', '😨', '😰', '😯', '😦',
    '😢', '😥', '😪', '😓', '🤤', '😭', '😲', '🤥', '🤢', '🤧', '🤐', '😷',
    '🤒', '🤕',
  ];

  /// 更多列表
  static final moreList = [
    MoreItem(name: '拍摄', icon: Icon(IconUtil.camera), path: CommRoute.camera),
    MoreItem(name: '照片', icon: Icon(IconUtil.camera), path: CommRoute.images),
    MoreItem(name: '视频', icon: Icon(IconUtil.camera), path: CommRoute.videos),
    MoreItem(name: '音频', icon: Icon(IconUtil.camera), path: CommRoute.videos),
  ];

}

/// 更多菜单
class MoreItem {
  final String name;
  final Icon icon;
  final String path;

  MoreItem({required this.name, required this.icon, required this.path});
}