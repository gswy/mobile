
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/cores/utils/host_util.dart';
import 'package:app/route/base/base_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

/// 视频服务
class VideosCtrl extends BaseCtrl {

  final message = ''.obs;

  final loading = false.obs;

  /// 视频控制器
  late final VideoPlayerController video;

  /// 播放器插件
  ChewieController? chewie;

  @override void onInit() {
    super.onInit();
    final path = Get.arguments as String;
    final url = '${HostUtil.getHttp()}$path';
    final uri = Uri.parse(url);
    video = VideoPlayerController.networkUrl(uri);
    _initVideo();
  }

  /// 加载视频
  Future<void> _initVideo() async {
    loading.value = true;
    try {
      await video.initialize();
      chewie = ChewieController(
        videoPlayerController: video,
        autoPlay: true,
        looping: true,
      );
    } catch (_) {
      message.value = '播放失败';
    } finally {
      loading.value = false;
    }
  }

  @override void onClose() {
    video.dispose();
    super.onClose();
  }

}