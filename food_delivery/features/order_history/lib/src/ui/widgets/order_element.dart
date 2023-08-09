import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'animated_text.dart';

class OrderElement extends StatefulWidget {
  final OrderModel orderItem;

  const OrderElement({
    required this.orderItem,
    Key? key,
  }) : super(key: key);

  @override
  State<OrderElement> createState() => _OrderElementState();
}

class _OrderElementState extends State<OrderElement>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.size2,
        vertical: AppSize.size5,
      ),
      child: ExpansionTile(
        onExpansionChanged: (bool value) {
          if (value) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        collapsedIconColor: themeData.primaryColor,
        tilePadding: const EdgeInsets.all(
          AppPadding.padding10,
        ),
        title: ListTile(
          title: Text(
            '\$${widget.orderItem.cart.totalPrice}',
            style: themeData.textTheme.titleMedium,
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(
              widget.orderItem.dateTime,
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
          SizeTransition(
            sizeFactor: _animation,
            child: Column(
              children: <Widget>[
                ...List.generate(
                  widget.orderItem.cart.dishes.length,
                  (int index) {
                    final CartDish cartDish =
                        widget.orderItem.cart.dishes[index];
                    return AnimatedText(
                      dishTitle: cartDish.dish.title,
                      dishCost: '${cartDish.quantity}x \$${cartDish.dish.cost}',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
