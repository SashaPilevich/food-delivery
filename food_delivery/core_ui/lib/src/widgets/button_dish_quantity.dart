import 'package:flutter/material.dart';

class ButtonDishQuantity extends StatelessWidget {
  final VoidCallback increaseQuantity;
  final VoidCallback decreaseQuantity;
  final String quantity;

  const ButtonDishQuantity({
    required this.increaseQuantity,
    required this.decreaseQuantity,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Row(
      children: <Widget>[
        IconButton(
          onPressed: decreaseQuantity,
          icon: Icon(
            Icons.remove_circle_outline,
            color: themeData.primaryColor,
          ),
        ),
        Text(
          quantity,
          style: themeData.textTheme.titleMedium,
        ),
        IconButton(
          onPressed: increaseQuantity,
          icon: Icon(
            Icons.add_circle_outline,
            color: themeData.primaryColor,
          ),
        ),
      ],
    );
  }
}
