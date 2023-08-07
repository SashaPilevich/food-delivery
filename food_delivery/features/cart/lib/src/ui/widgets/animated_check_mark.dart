import 'package:flutter/material.dart';

class CheckMarkAnimation extends StatefulWidget {
  const CheckMarkAnimation({super.key});

  @override
  State<CheckMarkAnimation> createState() => _CheckMarkAnimationState();
}

class _CheckMarkAnimationState extends State<CheckMarkAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animationScale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationScale = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animationScale,
      child: Image.asset('assets/image/checked.png'),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
