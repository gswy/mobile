import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/views/load_view.dart';
import 'package:app/ctrls/comm/videos_ctrl.dart';
import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

/// 图片预览
class VideosPage extends BaseView<VideosCtrl> {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('预览视频'),
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onPrimary,
      ),
      body: Obx(
        () => LoadView(
          loading: controller.loading.value,
          builder: (_) {
            return Chewie(controller: controller.chewie!);
          },
        ),
      ),
    );
  }
}
