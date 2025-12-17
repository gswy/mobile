
import 'package:app/cores/widgets/load_view.dart';
import 'package:app/ctrls/comm/qrcode_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

/// 二维码页面
class QrcodePage extends GetView<QrcodeCtrl> {
  const QrcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Get.width / 2;
    return GetBuilder<QrcodeCtrl>(
      initState: (_) {
        controller.initCode();
      },
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('我的二维码')),
        body: Obx(() {
          return LoadView(
            loading: controller.loading.value,
            message: controller.message.value,
            builder: (BuildContext context) {
              return Center(
                child: SizedBox(
                  height: size, width: size,
                  child: PrettyQrView.data(
                    data: 'https://example.com',
                    decoration: PrettyQrDecoration(
                      shape: PrettyQrSmoothSymbol(
                        color: Theme.of(context).colorScheme.primary, // 这里换成你要的颜色
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }



}