import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ButtonDishCard extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonDishCard({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size(AppSize.size_60, AppSize.size_30),
        textStyle: themeData.textTheme.labelMedium,
      ),
      child: Text(label),
    );
  }
}
