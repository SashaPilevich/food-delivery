import 'package:flutter/material.dart';

class FontSizeAnimatedBox extends StatelessWidget {
  final Widget child;

  const FontSizeAnimatedBox({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SizedBox(
      height: mediaQueryData.size.height * 0.08,
      width: mediaQueryData.size.width * 0.2,
      child: child,
    );
  }
}
