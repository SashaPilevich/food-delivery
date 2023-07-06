import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String src;
  final double height;
  const AppImage({
    required this.src,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
    );
  }
}
