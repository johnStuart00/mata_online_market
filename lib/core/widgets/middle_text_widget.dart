import 'package:flutter/material.dart';

class MiddleTextWidget {
  String text;
  MiddleTextWidget({required this.text});
  Widget build() {
    return Text(
      text,
      //style: TextStyle(fontSize: 20),
    );
  }
}
