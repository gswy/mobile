import 'package:flutter/material.dart';

/// 基本输入
class BaseInput extends StatelessWidget {
  /// 控制器
  final TextEditingController controller;

  /// 描述
  final String hint;

  /// 是否居中
  final bool center;

  /// 是否密码
  final bool obscure;

  /// 是否只读
  final bool enabled;

  /// 前缀
  final Widget? prefix;

  /// 后缀
  final Widget? suffix;

  const BaseInput({
    super.key,
    required this.controller,
    required this.hint,
    this.center = false,
    this.obscure = false,
    this.enabled = true,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      obscureText: obscure,
      textAlign: center ? TextAlign.center : TextAlign.left,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
