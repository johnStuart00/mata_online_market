import 'package:flutter/material.dart';

class MiddleTextWidget extends StatelessWidget {
  final String text;
  const MiddleTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}
