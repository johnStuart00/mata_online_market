import 'package:flutter/material.dart';

class BigTextWidget {
  String text;

  BigTextWidget({required this.text});

  Widget build() {
    return Text(
      text,
      //style: TextStyle(fontSize: 30),
    );
  }
}
