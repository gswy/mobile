
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends GetView {

  final String? url;

  final String name;

  final double size;

  final double radio;

  final Function()? onTap;

  const Avatar({super.key, required this.url, required this.name, this.size = 54, this.radio = 4, this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radio)
        ),
        clipBehavior: Clip.antiAlias,
        child: url == null ? Text(name.trim().characters.first) : _image(),
      ),
    );
  }

  Widget _image() {
    return ExtendedImage.network(
      url!,
      fit: BoxFit.cover,
      cache: true,
    );
  }

}