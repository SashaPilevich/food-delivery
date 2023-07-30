import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class OrderElement extends StatelessWidget {
  final OrderModel orderItem;

  const OrderElement({
    required this.orderItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.size2,
        vertical: AppSize.size5,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(
          AppPadding.padding10,
        ),
        title: ListTile(
          title: Text(
            '\$${orderItem.cart.totalPrice}',
            style: themeData.textTheme.titleMedium,
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(
              orderItem.dateTime,
            ),
            style: themeData.textTheme.headlineMedium!.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        childrenPadding: const EdgeInsets.all(
          AppPadding.padding30,
        ),
        children: <Widget>[
          ...List.generate(
            orderItem.cart.dishes.length,
            ((int index) {
              final CartDish cartDish = orderItem.cart.dishes[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    cartDish.dish.title,
                    style: themeData.textTheme.headlineMedium,
                  ),
                  Text(
                    '${cartDish.quantity}x \$${cartDish.dish.cost}',
                    style: themeData.textTheme.titleSmall!.copyWith(
                      fontSize: 14,
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
