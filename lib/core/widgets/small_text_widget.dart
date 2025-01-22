import 'package:flutter/material.dart';

class SmallTextWidget {
  String text;
  SmallTextWidget({required this.text});
  Widget build() {
    return Text(
      text,
      //style: TextStyle(fontSize: 12),
    );
  }
}
