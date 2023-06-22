import 'package:domain/models/dish/dish_model.dart';
import 'package:flutter/material.dart';
import 'button_dish_card.dart';
import 'image_dish_card.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: const Color.fromARGB(255, 103, 42, 62),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 0,
            left: 15,
            right: 15,
          ),
          child: Column(
            children: <Widget>[
              ImageDishCard(imageUrl:dish.imageUrl),
              const SizedBox(height: 10),
              Text(
                dish.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '\$${dish.cost}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const Expanded(
                    child: ButtonDishCard(
                      label: '+Add',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

