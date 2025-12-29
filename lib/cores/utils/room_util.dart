
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
    MoreItem(name: '拍照片', icon: IconUtil.cameraFull),
    MoreItem(name: '录视频', icon: IconUtil.recordFull),
    MoreItem(name: '图片', icon: IconUtil.imagesFull),
    MoreItem(name: '视频', icon: IconUtil.videosFull),
  ];

}

/// 更多菜单
class MoreItem {
  final String name;
  final IconData icon;

  MoreItem({required this.name, required this.icon});
}