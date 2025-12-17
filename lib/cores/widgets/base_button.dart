import 'package:flutter/material.dart';

/// 基本按钮
class BaseButton extends StatelessWidget {
  /// 显示文字
  final String name;

  /// 事件回调
  final Function()? onPressed;

  /// 是否加载
  final bool loading;

  /// 构造函数
  const BaseButton({
    super.key,
    required this.name,
    this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: loading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            )
          : Text(name, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
