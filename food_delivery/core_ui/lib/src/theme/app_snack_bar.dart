import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static void show(
    BuildContext context,
    String message,
  ) {
    final ThemeData themeData = Theme.of(context);
    final snackbar = SnackBar(
      backgroundColor: Colors.pink,
      content: Text(
        message,
        style: themeData.textTheme.titleMedium!.copyWith(
          color: AppColors.white,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
