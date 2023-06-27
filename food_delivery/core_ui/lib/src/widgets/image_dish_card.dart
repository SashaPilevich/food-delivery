import 'package:flutter/material.dart';

class ImageDishCard extends StatelessWidget {
  final String imageUrl;

  const ImageDishCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Image.network(
        imageUrl,
        height: 100,
      ),
    );
  }
}
