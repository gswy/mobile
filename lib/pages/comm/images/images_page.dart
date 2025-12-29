import 'package:app/cores/bases/base_view.dart';
import 'package:app/cores/utils/host_util.dart';
import 'package:app/ctrls/comm/images_ctrl.dart';

import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';

/// 图片预览
class ImagesPage extends BaseView<ImagesCtrl> {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('预览图片'),
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onPrimary,
      ),
      body: SizedBox.expand(
        child: ExtendedImage.network(
          '${HostUtil.getHttp()}${controller.filepath}',
          fit: BoxFit.contain,
          mode: ExtendedImageMode.gesture,
          cache: true,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 1.0,
              maxScale: 5.0,
              animationMinScale: 0.8,
              animationMaxScale: 6.0,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
            );
          },
        ),
      ),
    );
  }
}
