import 'package:flutter/material.dart';

class ImageDishSelect extends StatelessWidget {
  final String imageUrl;

  const ImageDishSelect({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Hero(
      tag: imageUrl,
      child: Image.network(
        imageUrl,
        height: mediaQueryData.size.height * 0.35,
      ),
    );
  }
}
