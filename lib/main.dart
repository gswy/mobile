import 'package:app/bases/base_bind.dart';
import 'package:app/bases/base_main.dart';
import 'package:app/bases/base_them.dart';
import 'package:app/route/app_route.dart';
import 'package:app/route/base/base_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

/// 主函数入口
void main() => BaseMain.init().then((value) => runApp(MyApp()));

/// 主页面入口
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: ToastificationWrapper(
        child: Obx(() {
          return GetMaterialApp(
            initialRoute: BaseRoute.star,
            themeMode: BaseMain.themeMode.value,
            theme: BaseThem.light,
            darkTheme: BaseThem.night,
            initialBinding: BaseBind(),
            getPages: AppRoute.routes,
          );
        }),
      ),
    );
  }
}
