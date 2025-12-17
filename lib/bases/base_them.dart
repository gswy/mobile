
import 'package:flutter/material.dart';

class BaseThem {

  /// 亮色主题
  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
      elevation: 4,
      centerTitle: true,
    ),
  );

  /// 深色主题
  static ThemeData get night => ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
      elevation: 4,
      centerTitle: true,
    ),
  );

}