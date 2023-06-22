import 'package:core_ui/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.pink,
      ),
      primaryColor: AppColors.pink,
      canvasColor: AppColors.grey,
      fontFamily: 'RobotoCondensed',
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.pink,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.pink,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: const CardTheme(
        color: AppColors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      primaryColor: AppColors.orange,
      canvasColor: AppColors.black,
      fontFamily: 'RobotoCondensed',
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: const CardTheme(
        color: Color.fromARGB(255, 75, 71, 71),
      ),
      filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(AppColors.white),
        ),
      ),
    );
  }
}
