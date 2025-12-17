
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Toast {
  Toast._();

  static void show() {}

  static void error(String text) {
    final context = Get.context!;
    final color = Theme.of(context).colorScheme;
    toastification.showCustom(
      animationDuration: const Duration(milliseconds: 200),
      autoCloseDuration: const Duration(milliseconds: 2000),
      alignment: Alignment.center,
      builder: (context, holder) {
        return Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: color.surfaceContainerHigh.withAlpha(180), // 半透明背景
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.onSurfaceVariant,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
