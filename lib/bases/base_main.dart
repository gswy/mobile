
import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/utils/desk_util.dart';
import 'package:app/cores/utils/them_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// 全局基础
class BaseMain {
  /// 禁止构造
  BaseMain._();

  /// 主题切换
  static final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  /// 应用初始化
  static Future<void> init() async {
    /// 应用初始化
    WidgetsFlutterBinding.ensureInitialized();

    /// 初始化存储
    await LocalStore.init();

    /// 初始化主题
    initTheme();

    /// 初始化设备
    await DeskUtil.init();

    /// 设置系统样式
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    /// 锁定竖屏显示
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  /// 设置主题
  static void initTheme() {
    final auto = ThemUtil.getAuto();
    if (auto) {
      themeMode.value = ThemeMode.system;
      return;
    }
    final mode = ThemUtil.getMode();
    if (mode == 'night') {
      themeMode.value = ThemeMode.dark;
    }
    if (mode == 'light') {
      themeMode.value = ThemeMode.light;
    }
  }

}
