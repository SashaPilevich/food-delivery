import 'package:flutter/material.dart';

class ImageDishCart extends StatelessWidget {
  final String imageUrl;

  const ImageDishCart({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Image.network(
      imageUrl,
      height: mediaQueryData.size.height * 0.13,
      fit: BoxFit.cover,
    );
  }
}
