import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CheckMarkAnimation extends StatelessWidget {
  const CheckMarkAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      builder: (
        _,
        double value,
        Widget? child,
      ) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      child: Image.asset(
        ImagePath.successOrderMarked,
      ),
    );
  }
}
