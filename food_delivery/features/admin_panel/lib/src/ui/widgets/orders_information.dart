import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'custom_checkbox.dart';
import 'no_orders_content.dart';
import 'order_card.dart';

class OrdersInformation extends StatelessWidget {
  const OrdersInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc =
        BlocProvider.of<AdminPanelBloc>(context);
    final ThemeData themeData = Theme.of(context);

    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (_, AdminPanelState state) {
        if (state.isLoading) {
          return const LoadingIndicator();
        }
        if (state.listOfUncompletedOrders.isNotEmpty) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.padding30,
                  bottom: AppPadding.padding20,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'adminPanelScreen.newOrders'.tr(),
                    style: themeData.textTheme.titleLarge,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.listOfUncompletedOrders.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.padding10,
                    ),
                    child: OrderCard(
                      orderWithUserInfoModel:
                          state.listOfUncompletedOrders[index],
                      widget: CustomCheckBox(
                        isComplete: state.listOfUncompletedOrders[index]
                            .orderModel.isComplete,
                        onChanged: (bool? value) {
                          adminPanelBloc.add(
                            UpdateOrderStatus(
                              uid: state
                                  .listOfUncompletedOrders[index].orderModel.id,
                              isComplete: !state.listOfUncompletedOrders[index]
                                  .orderModel.isComplete,
                            ),
                          );
                          AppSnackbar.show(
                            context,
                            'adminPanelScreen.orderCompleted'.tr(),
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          );
        } else {
          return const NoOrdersContent();
        }
      },
    );
  }
}
