import 'package:flutter/material.dart';

class OldMarkTextWidget extends StatelessWidget {
  final String text;
  const OldMarkTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Theme.of(context).textTheme.bodyLarge?.color,
        decoration: TextDecoration.lineThrough,
      ),
    );
  }
}
