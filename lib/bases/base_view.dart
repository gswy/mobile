
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseView<T> extends GetView<T> {

  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      behavior: HitTestBehavior.translucent,
      child: null,
    );
  }

}
