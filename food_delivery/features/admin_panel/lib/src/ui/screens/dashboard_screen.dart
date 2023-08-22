import 'package:admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:admin_panel/src/ui/widgets/button_add_products.dart';
import 'package:admin_panel/src/ui/widgets/dashboard_information.dart';
import 'package:admin_panel/src/ui/widgets/orders_information.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc =
        BlocProvider.of<AdminPanelBloc>(context);
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    adminPanelBloc.add(const InitOrders());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Admin!'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context.locale == const Locale('en', 'US')
                  ? context.setLocale(const Locale('pl', 'PL'))
                  : context.setLocale(const Locale('en', 'US'));
            },
            icon: const Icon(
              Icons.language,
              color: AppColors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              authBloc.add(SignOutSubmitted());
              authBloc.add(
                NavigateToSignInScreen(),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonAddProducts(
              onPressed: () {
                adminPanelBloc.add(
                  const NavigateToAddProductsScreen(),
                );
              },
            ),
            const DashboardInformation(),
            const OrdersInformation(),
          ],
        ),
      ),
    );
  }
}
