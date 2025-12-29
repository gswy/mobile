
import 'package:app/binds/comm/images_bind.dart';
import 'package:app/binds/comm/qrcode_bind.dart';
import 'package:app/binds/comm/videos_bind.dart';
import 'package:app/binds/comm/voices_bind.dart';
import 'package:app/pages/comm/images/images_page.dart';
import 'package:app/pages/comm/qrcode/qrcode_page.dart';
import 'package:app/pages/comm/videos/videos_page.dart';
import 'package:app/pages/comm/voices/voices_page.dart';
import 'package:app/route/comm/comm_route.dart';
import 'package:get/get.dart';

class CommPages {
  CommPages._();

  static final routes = [
    GetPage(
      name: CommRoute.qrcode,
      page: () => QrcodePage(),
      binding: QrcodeBind(),
    ),
    GetPage(
      name: CommRoute.images,
      page: () => ImagesPage(),
      binding: ImagesBind(),
    ),
    GetPage(
      name: CommRoute.videos,
      page: () => VideosPage(),
      binding: VideosBind(),
    ),
    GetPage(
      name: CommRoute.voices,
      page: () => VoicesPage(),
      binding: VoicesBind(),
    ),
  ];
}
