import 'package:core_ui/src/theme/app_colors.dart';
import 'package:core_ui/src/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.pink,
      ),
      primaryColor: AppColors.pink,
      canvasColor: AppColors.grey,
      appBarTheme: const AppBarTheme(
        titleTextStyle: AppTextTheme.robotoCondensed22SemiBold,
      ),
      textTheme: TextTheme(
        titleLarge:
            AppTextTheme.robotoCondensed20Bold.apply(color: AppColors.pink),
        titleMedium:
            AppTextTheme.robotoCondensed18Bold.apply(color: AppColors.pink),
        labelMedium: AppTextTheme.robotoCondensed16Medium,
      ),
      cardTheme: const CardTheme(
        color: AppColors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.darkGrey,
        selectedItemColor: AppColors.pink,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
      primaryColor: AppColors.orange,
      canvasColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        titleTextStyle: AppTextTheme.robotoCondensed22SemiBold,
      ),
      textTheme: TextTheme(
        titleLarge:
            AppTextTheme.robotoCondensed20Bold.apply(color: AppColors.white),
        titleMedium:
            AppTextTheme.robotoCondensed18Bold.apply(color: AppColors.white),
        labelMedium: AppTextTheme.robotoCondensed16Medium,
      ),
      cardTheme: const CardTheme(
        color: AppColors.darkGrey,
      ),
      filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(AppColors.white),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGrey,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.orange,
      ),
    );
  }
}
