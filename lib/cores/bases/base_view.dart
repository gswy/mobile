
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 基本页面
abstract class BaseView<T> extends GetView<T> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context);
}