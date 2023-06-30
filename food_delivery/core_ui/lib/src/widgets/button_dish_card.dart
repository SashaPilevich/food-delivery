import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ButtonDishCard extends StatelessWidget {
  final String label;

  const ButtonDishCard({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textStyle = Theme.of(context).textTheme;
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        minimumSize: const Size(AppSize.size_60, AppSize.size_30),
        textStyle: textStyle.labelMedium,
      ),
      child: Text(label),
    );
  }
}
