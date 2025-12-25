import 'package:app/cores/utils/host_util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Avatar extends GetView {
  final String? url;

  final String name;

  final double size;

  final double textSize;

  final FontWeight fontWeight;

  final double radio;

  final Function()? onTap;

  const Avatar({
    super.key,
    required this.url,
    required this.name,
    this.size = 54,
    this.textSize = 20,
    this.fontWeight = FontWeight.w500,
    this.radio = 4,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radio),
          color: scheme.primaryContainer,
        ),
        clipBehavior: Clip.antiAlias,
        child: url == null
            ? Center(
                child: Text(
                  name.trim().characters.first,
                  style: TextStyle(color: scheme.primary, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : _image(),
      ),
    );
  }

  Widget _image() {
    return ExtendedImage.network('${HostUtil.getHttp()}$url', fit: BoxFit.cover, cache: true);
  }
}
