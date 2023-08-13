import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:settings/settings.dart';

class CustomReadMoreText extends StatelessWidget {
  final String? text;

  const CustomReadMoreText({
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return ReadMoreText(
          text ?? 'selectDishScreen.descriptionNotAvailable'.tr(),
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'selectDishScreen.showMore'.tr(),
          trimExpandedText: 'selectDishScreen.showLess'.tr(),
          style: themeData.textTheme.titleSmall,
          moreStyle: AppTextTheme.mulish16Bold.copyWith(
            color: state.isSystemTheme
                ? AppColors.darkGrey
                : themeData.primaryColor,
          ),
          lessStyle: AppTextTheme.mulish16Bold.copyWith(
            color: state.isSystemTheme
                ? AppColors.darkGrey
                : themeData.primaryColor,
          ),
        );
      },
    );
  }
}
