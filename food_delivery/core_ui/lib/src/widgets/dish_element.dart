import 'package:domain/models/dish/dish_model.dart';
import 'package:flutter/material.dart';

class DishElement extends StatelessWidget {
  final DishModel dish;
  final Function() onTap;
  const DishElement({
    required this.dish,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
