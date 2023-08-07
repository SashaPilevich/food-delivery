import 'package:flutter/material.dart';

class ChangeDishQuantity extends StatelessWidget {
  final VoidCallback increaseQuantity;
  final VoidCallback decreaseQuantity;
  final String quantity;
  const ChangeDishQuantity({
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
          style: themeData.textTheme.headlineMedium,
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
