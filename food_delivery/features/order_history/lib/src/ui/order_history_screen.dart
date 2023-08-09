import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';

import 'widgets/order_element.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'homePage.orderHistory'.tr(),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (_, OrderState state) {
          if (state.isLoading) {
            return const LoadingIndicator();
          }
          if (state.orderItems.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: state.orderItems.length,
                    itemBuilder: (_, index) {
                      return OrderElement(
                        orderItem: state.orderItems[index],
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return EmptyContent(
              onPressed: () {
                context.navigateTo(const HomeScreenRoute());
              },
              title: 'orderHistoryScreen.orderHistoryEmpty'.tr(),
              imageUrl: ImagePath.emptyOrderHistory,
            );
          }
        },
      ),
    );
  }
}
