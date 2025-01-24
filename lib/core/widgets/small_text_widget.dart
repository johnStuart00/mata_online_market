import 'package:flutter/material.dart';

class SmallTextWidget extends StatelessWidget {
  final String text;
  const SmallTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}
