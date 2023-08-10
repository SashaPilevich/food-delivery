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
        titleTextStyle: AppTextTheme.mulish22Bold,
      ),
      textTheme: TextTheme(
        titleLarge: AppTextTheme.mulish20Black.copyWith(
          color: AppColors.pink,
        ),
        titleMedium: AppTextTheme.mulish18Black.copyWith(
          color: AppColors.pink,
        ),
        titleSmall: AppTextTheme.mulish18Regular.copyWith(
          color: AppColors.lightGrey,
        ),
        labelMedium: AppTextTheme.mulish16Bold,
        headlineLarge: AppTextTheme.mulish26Bold.copyWith(
          color: AppColors.pink,
        ),
        headlineMedium: AppTextTheme.mulish16Bold.copyWith(
          color: AppColors.black,
        ),
      ),
      cardTheme: const CardTheme(
        color: AppColors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.darkGrey,
        selectedItemColor: AppColors.pink,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.pink,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
      ),
      primaryColor: AppColors.orange,
      canvasColor: AppColors.black,
      appBarTheme: const AppBarTheme(
        titleTextStyle: AppTextTheme.mulish22Bold,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: AppTextTheme.mulish20Black.copyWith(
          color: AppColors.white,
        ),
        titleMedium: AppTextTheme.mulish18Black.copyWith(
          color: AppColors.white,
        ),
        titleSmall: AppTextTheme.mulish18Regular.copyWith(
          color: AppColors.white,
        ),
        labelMedium: AppTextTheme.mulish16Bold,
        headlineLarge: AppTextTheme.mulish26Bold.copyWith(
          color: AppColors.orange,
        ),
        headlineMedium: AppTextTheme.mulish16Bold.copyWith(
          color: AppColors.white,
        ),
      ),
      cardTheme: const CardTheme(
        color: AppColors.darkGrey,
      ),
      filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(
            AppColors.white,
          ),
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(
            AppColors.white,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGrey,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.orange,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.orange,
      ),
    );
  }
}
