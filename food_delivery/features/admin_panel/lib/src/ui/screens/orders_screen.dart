import 'package:admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:admin_panel/src/ui/widgets/no_orders_content.dart';
import 'package:admin_panel/src/ui/widgets/order_card.dart';
import 'package:admin_panel/src/ui/widgets/order_status.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'adminPanelScreen.orders'.tr(),
      ),
      body: BlocBuilder<AdminPanelBloc, AdminPanelState>(
        builder: (_, AdminPanelState state) {
          if (state.listOfOrders.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.padding10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.listOfOrders.length,
                      itemBuilder: (_, int index) {
                        return OrderCard(
                          orderWithUserInfoModel: state.listOfOrders[index],
                          widget: OrderStatus(
                            isComplete:
                                state.listOfOrders[index].orderModel.isComplete,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const NoOrdersContent();
          }
        },
      ),
    );
  }
}
