import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final DishModel dishModel;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ProductCard({
    super.key,
    required this.dishModel,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding15,
          vertical: AppPadding.padding20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppCacheImage(
              imageUrl: dishModel.imageUrl,
              height: mediaQueryData.size.height * 0.13,
            ),
            const SizedBox(
              width: AppSize.size20,
            ),
            DishInformation(
              dishTitle: dishModel.title,
              dishCost: '\$${dishModel.cost}',
            ),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onDelete,
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: onEdit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
