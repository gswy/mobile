import 'package:flutter/material.dart';

class BaseThem {
  /// 亮色主题
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    final color = base.colorScheme;

    return base.copyWith(
      /// 公共头部
      appBarTheme: AppBarTheme(elevation: 4, centerTitle: true),

      /// 公共按钮
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size.fromHeight(52),
          backgroundColor: color.primaryContainer,
          foregroundColor: color.onPrimaryContainer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      /// 公共卡片
      // cardTheme: CardThemeData(
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12),
      //     side: BorderSide(color: color.surfaceContainerHigh),
      //   ),
      // ),
    );
  }

  /// 深色主题
  static ThemeData get night {
    final base = ThemeData.dark(useMaterial3: true);
    final color = base.colorScheme;

    return base.copyWith(
      /// 公共头部
      appBarTheme: AppBarTheme(elevation: 4, centerTitle: true),

      /// 公共按钮
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size.fromHeight(52),
          backgroundColor: color.primaryContainer,
          foregroundColor: color.onPrimaryContainer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      /// 公共卡片
      // cardTheme: CardThemeData(
      //   elevation: 0,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12),
      //     side: BorderSide(color: color.surfaceContainerHigh),
      //   ),
      // ),
    );
  }
}



