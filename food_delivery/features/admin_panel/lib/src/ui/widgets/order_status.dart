import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final bool isComplete;

  const OrderStatus({
    required this.isComplete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isComplete
        ? Row(
            children: <Widget>[
              const Icon(
                Icons.done,
                color: AppColors.pinkAccent,
                size: AppSize.size30,
              ),
              const SizedBox(
                width: AppSize.size5,
              ),
              Container(
                padding: const EdgeInsets.all(
                  AppPadding.padding6,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppSize.size15,
                    ),
                  ),
                  color: AppColors.pinkAccent,
                ),
                child: Text(
                  'adminPanelScreen.orderCompleted'.tr(),
                  style: AppTextTheme.mulish14SemiBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: <Widget>[
              const Icon(
                Icons.error_outline_rounded,
                color: AppColors.darkPink,
                size: AppSize.size30,
              ),
              const SizedBox(
                width: AppSize.size5,
              ),
              Text(
                'adminPanelScreen.orderUncompleted'.tr(),
                style: AppTextTheme.mulish14SemiBold.copyWith(
                  color: AppColors.darkPink,
                ),
              ),
            ],
          );
  }
}
