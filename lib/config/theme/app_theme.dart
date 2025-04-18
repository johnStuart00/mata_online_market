import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_color.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.whiteThemeBack,
      primaryColor: AppColors.whiteThemeContainer,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.whiteThemeText),
          bodyMedium: TextStyle(color: AppColors.whiteThemeBack)),
      iconTheme: const IconThemeData(color: AppColors.whiteThemeIcon),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteThemeBack,
        iconTheme: IconThemeData(color: AppColors.whiteThemeIcon),
        titleTextStyle: TextStyle(
          color: AppColors.whiteThemeText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardColor: const Color.fromARGB(185, 132, 155, 129),
      buttonTheme:
          const ButtonThemeData(buttonColor: AppColors.whiteThemeContainer),
      // ignore: deprecated_member_use
      shadowColor: Colors.black.withOpacity(0.1),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white) // Add shadow color here
      );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkThemeBack,
      primaryColor: AppColors.darkThemeContainer,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkThemeText),
        bodyMedium: TextStyle(color: AppColors.darkThemeBack),
      ),
      iconTheme: const IconThemeData(color: AppColors.darkThemeIcon),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkThemeBack,
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
      // ignore: deprecated_member_use
      shadowColor: Colors.white.withOpacity(0.1),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.dark) // Add shadow color here
      );
}
