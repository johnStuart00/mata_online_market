// There I will define all the app spacing (padding, margin)
import 'package:flutter/material.dart';

class AppSpacing {
  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardPadding =
      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);

  // Margins
  static const EdgeInsets buttonMargin = EdgeInsets.only(top: 8.0);
  static const EdgeInsets sectionMargin = EdgeInsets.symmetric(vertical: 16.0);

  //Radius
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius dotsRadius =
      BorderRadius.all(Radius.circular(25.0));
}
