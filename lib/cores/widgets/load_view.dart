import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadView extends GetView {
  /// 是否加载中
  final bool loading;

  /// 加载失败元素
  final String message;

  /// 加载成功元素
  final Widget Function(BuildContext context) builder;

  const LoadView({
    super.key,
    required this.loading,
    required this.builder,
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.onSecondaryFixed;
    final color = Theme.of(context).colorScheme.onSecondary;
    if (loading) {
      return Center(
        child: Container(
          height: 120,
          width: 110,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
                Text('加载中', style: TextStyle(color: color)),
              ],
            ),
          ),
        ),
      );
    }
    if (message.isNotEmpty) {
      return Center(child: Text(message, style: TextStyle(fontSize: 16)));
    }
    return builder(context);
  }
}
