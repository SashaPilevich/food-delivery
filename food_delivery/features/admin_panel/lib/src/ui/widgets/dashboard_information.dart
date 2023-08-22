import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:admin_panel/src/ui/widgets/circle_element_with_data.dart';
import 'package:admin_panel/src/ui/widgets/dashboard_header.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DashboardInformation extends StatelessWidget {
  const DashboardInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (_, AdminPanelState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.padding40,
            horizontal: AppPadding.padding20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  DashboardHeader(
                    title: 'adminPanelScreen.activeUsers'.tr(),
                    icon: const Icon(
                      Icons.person,
                    ),
                  ),
                  CircleElementWithData(
                    title: '${state.numberOfUsers}',
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  DashboardHeader(
                    title: 'adminPanelScreen.totalSales'.tr(),
                    icon: const Icon(
                      Icons.attach_money,
                    ),
                  ),
                  CircleElementWithData(
                    title: '\$${state.salesAmount}',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
