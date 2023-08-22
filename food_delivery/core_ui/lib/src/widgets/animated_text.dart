import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String dishTitle;
  final String dishCost;

  const AnimatedText({
    required this.dishTitle,
    required this.dishCost,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      curve: Curves.easeIn,
      duration: const Duration(
        seconds: 1,
      ),
      builder: (_, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            dishTitle,
            style: themeData.textTheme.headlineMedium,
          ),
          Text(
            dishCost,
            style: themeData.textTheme.titleSmall!.copyWith(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
