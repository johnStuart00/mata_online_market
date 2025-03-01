//There  I will define all the app dimensions (height, width, size)
import 'package:flutter/material.dart';

class AppDimensions {
  static Size screenWidth80(BuildContext context) {
    return Size(MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.height);
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double setWidth(BuildContext context, double percentage) {
    return screenWidth(context) * percentage;
  }

  //dots decorate dots size
  static const Size dotsSize = Size(10.0, 10.0);
  static const Size dotsActiveSize = Size(20.0, 10.0);
}
