import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_color.dart';

class BigTextWidget extends StatelessWidget {
  final String text;

  const BigTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}
