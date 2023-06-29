import 'package:core_ui/src/theme/app_text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatelessWidget {
  final String? text;

  const CustomReadMoreText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return ReadMoreText(
      text ?? 'Description not available',
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'showMore'.tr(),
      trimExpandedText: 'showLess'.tr(),
      style: textTheme.titleSmall,
      moreStyle: AppTextTheme.mulish16Bold.copyWith(
        color: themeData.primaryColor,
      ),
      lessStyle: AppTextTheme.mulish16Bold.copyWith(
        color: themeData.primaryColor,
      ),
    );
  }
}
