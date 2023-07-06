import 'package:core/core.dart';
import 'package:core_ui/src/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatelessWidget {
  final String? text;

  const CustomReadMoreText({
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return ReadMoreText(
      text ?? 'selectDishScreen.descriptionNotAvailable'.tr(),
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'selectDishScreen.showMore'.tr(),
      trimExpandedText: 'selectDishScreen.showLess'.tr(),
      style: themeData.textTheme.titleSmall,
      moreStyle: AppTextTheme.mulish16Bold.copyWith(
        color: themeData.primaryColor,
      ),
      lessStyle: AppTextTheme.mulish16Bold.copyWith(
        color: themeData.primaryColor,
      ),
    );
  }
}
