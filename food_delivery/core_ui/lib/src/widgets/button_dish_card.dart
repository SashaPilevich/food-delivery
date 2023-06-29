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
        minimumSize: const Size(60, 30),
        textStyle: textStyle.labelMedium,
      ),
      child: Text(label),
    );
  }
}
