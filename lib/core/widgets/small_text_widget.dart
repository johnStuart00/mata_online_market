import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_color.dart';

class SmallTextWidget extends StatelessWidget {
  final String text;
  const SmallTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: AppColors.whiteThemeText,
      ),
    );
  }
}
