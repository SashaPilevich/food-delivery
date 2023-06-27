import 'package:core_ui/src/theme/app_text_theme.dart';
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
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      style: textTheme.titleSmall,
      moreStyle: AppTextTheme.robotoCondensed18Regular
          .copyWith(color: themeData.primaryColor),
      lessStyle: AppTextTheme.robotoCondensed18Regular
          .copyWith(color: themeData.primaryColor),
    );
  }
}

