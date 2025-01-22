import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_color.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteThemeBack,
    primaryColor: AppColors.whiteThemeContainer,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.whiteThemeText),
      bodyMedium: TextStyle(color: AppColors.whiteThemeText),
    ),
    iconTheme: const IconThemeData(color: AppColors.whiteThemeIcon),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteThemeContainer,
      iconTheme: IconThemeData(color: AppColors.whiteThemeIcon),
      titleTextStyle: TextStyle(
        color: AppColors.whiteThemeText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: AppColors.whiteThemeContainer,
    buttonTheme:
        const ButtonThemeData(buttonColor: AppColors.whiteThemeContainer),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkThemeBack,
    primaryColor: AppColors.darkThemeContainer,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkThemeText),
      bodyMedium: TextStyle(color: AppColors.darkThemeText),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkThemeIcon),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkThemeContainer,
      iconTheme: IconThemeData(color: AppColors.darkThemeIcon),
      titleTextStyle: TextStyle(
        color: AppColors.darkThemeText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: AppColors.darkThemeContainer,
    buttonTheme:
        const ButtonThemeData(buttonColor: AppColors.darkThemeContainer),
  );
}
