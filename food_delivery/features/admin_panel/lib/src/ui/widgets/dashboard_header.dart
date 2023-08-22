import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final String title;
  final Icon icon;

  const DashboardHeader({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);

    return Container(
      width: mediaQueryData.size.width * 0.42,
      height: mediaQueryData.size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSize.size10,
        ),
        color: AppColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.lightGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(
        AppPadding.padding25,
      ),
      child: Row(
        children: <Widget>[
          icon,
          Expanded(
            child: Text(
              title,
              style: themeData.textTheme.labelMedium!.copyWith(
                color: AppColors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
