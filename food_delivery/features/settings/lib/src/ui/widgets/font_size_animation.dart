import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FontSizeAnimation extends StatelessWidget {
  final String riveAnimationPath;

  const FontSizeAnimation({
    required this.riveAnimationPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      riveAnimationPath,
      fit: BoxFit.contain,
    );
  }
}
