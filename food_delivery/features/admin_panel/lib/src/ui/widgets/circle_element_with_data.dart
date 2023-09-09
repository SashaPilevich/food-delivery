import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CircleElementWithData extends StatelessWidget {
  final String title;

  const CircleElementWithData({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -AppSize.size20,
      right: -AppSize.size10,
      child: Container(
        width: AppSize.size40,
        height: AppSize.size40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.pink,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextTheme.mulish14SemiBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
