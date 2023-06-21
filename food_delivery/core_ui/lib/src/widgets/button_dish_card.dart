import 'package:flutter/material.dart';

class ButtonDishCard extends StatelessWidget {
  final String label;
  const ButtonDishCard({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        minimumSize: const Size(60, 30),
        textStyle: Theme.of(context).textTheme.labelMedium,
      ),
      child: Text(label),
    );
  }
}