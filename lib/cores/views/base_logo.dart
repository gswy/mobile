
import 'package:app/cores/utils/font_util.dart';
import 'package:flutter/material.dart';

class BaseLogo extends StatelessWidget {
  const BaseLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'NextWork',
          style: TextStyle(
            fontSize: 68,
            fontWeight: FontWeight.w500,
            fontFamily: FontUtil.logo,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '让工作更高效，让协作更简单',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
