import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NoOrdersContent extends StatelessWidget {
  const NoOrdersContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.padding30,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'adminPanelScreen.noOrders'.tr(),
            style: themeData.textTheme.titleLarge,
          ),
          const AnimatedImage(
            child: ImageForEmptyState(
              imageUrl: ImagePath.emptyOrderHistory,
            ),
          ),
        ],
      ),
    );
  }
}
