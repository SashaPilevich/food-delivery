import 'package:flutter/material.dart';

class ImageDishSelect extends StatelessWidget {
  final String imageUrl;

  const ImageDishSelect({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Image.network(
        imageUrl,
        height: 300,
      ),
    );
  }
}
