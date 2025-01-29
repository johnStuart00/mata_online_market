import 'package:flutter/material.dart';

class MarkTextWidget extends StatelessWidget {
  final String text;
  const MarkTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
