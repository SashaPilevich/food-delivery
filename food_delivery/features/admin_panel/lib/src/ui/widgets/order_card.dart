import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final OrderWithUserInfoModel orderWithUserInfoModel;
  final Widget widget;

  const OrderCard({
    required this.widget,
    required this.orderWithUserInfoModel,
    super.key,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard>
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.size20,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.size10,
        vertical: AppSize.size5,
      ),
      child: ExpansionTile(
        onExpansionChanged: (bool value) {
          value
              ? _animationController.forward()
              : _animationController.reverse();
        },
        collapsedIconColor: themeData.primaryColor,
        tilePadding: const EdgeInsets.all(
          AppPadding.padding10,
        ),
        title: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.orderWithUserInfoModel.userModel.email,
                style: themeData.textTheme.titleMedium,
              ),
              const SizedBox(
                height: AppSize.size5,
              ),
              Text(
                DateFormat('dd/MM/yyyy hh:mm').format(
                  widget.orderWithUserInfoModel.orderModel.dateTime,
                ),
                style: themeData.textTheme.headlineMedium!.copyWith(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: AppSize.size10,
              ),
            ],
          ),
          subtitle: widget.widget,
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
                  widget.orderWithUserInfoModel.orderModel.cart.dishes.length,
                  (int index) {
                    final CartDish cartDish = widget
                        .orderWithUserInfoModel.orderModel.cart.dishes[index];
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
