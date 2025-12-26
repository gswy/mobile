
import 'package:app/cores/utils/font_util.dart';
import 'package:flutter/material.dart';

class BaseLogo extends StatelessWidget {
  const BaseLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'NovaChat',
          style: TextStyle(
            fontSize: 68,
            fontWeight: FontWeight.w500,
            fontFamily: FontUtil.logo,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '保持联系，随时实地',
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
