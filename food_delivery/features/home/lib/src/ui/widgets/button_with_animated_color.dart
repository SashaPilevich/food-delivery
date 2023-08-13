import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ButtonWithAnimatedColor extends StatefulWidget {
  final VoidCallback onPressed;

  const ButtonWithAnimatedColor({
    required this.onPressed,
    super.key,
  });

  @override
  State<ButtonWithAnimatedColor> createState() =>
      _ButtonWithAnimatedColorState();
}

class _ButtonWithAnimatedColorState extends State<ButtonWithAnimatedColor> {
  Color backgroundColor = AppColors.white;
  String text = 'selectDishScreen.addToCart'.tr();
  Color textColor = AppColors.pink;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.linear,
      child: SizedBox(
        width: mediaQueryData.size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shadowColor: backgroundColor,
          ),
          onPressed: () {
            widget.onPressed();
            setState(() {
              backgroundColor = themeData.primaryColor;
              textColor = AppColors.white;
              text = 'selectDishScreen.addedToCart'.tr();
            });
          },
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
