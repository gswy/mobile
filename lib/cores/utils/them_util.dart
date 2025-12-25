
import 'package:app/bases/base_main.dart';
import 'package:app/cores/store/local_store.dart';
import 'package:flutter/material.dart';

class ThemUtil {
  ThemUtil._();

  static final autoKey = 'them_auto';
  static final modeKey = 'them_mode';

  /// 设置自动切换
  static Future<void> setAuto(bool value) async {
    LocalStore.setBool(autoKey, value);
    if (value) {
      BaseMain.themeMode.value = ThemeMode.system;
    } else {
      final mode = getMode();
      if (mode == 'light') {
        BaseMain.themeMode.value = ThemeMode.light;
      }
      if (mode == 'night') {
        BaseMain.themeMode.value = ThemeMode.dark;
      }
    }
  }

  /// 设置自动切换
  static bool getAuto() {
    return LocalStore.getBool(autoKey);
  }

  /// 设置主题模式
  static Future<void> setMode(String value) async {
    await LocalStore.setString(modeKey, value);
    if (value == 'light') {
      BaseMain.themeMode.value = ThemeMode.light;
    }
    if (value == 'night') {
      BaseMain.themeMode.value = ThemeMode.dark;
    }
  }

  /// 获取主题模式
  static String getMode() {
    return LocalStore.getString(modeKey) ?? 'light';
  }

}