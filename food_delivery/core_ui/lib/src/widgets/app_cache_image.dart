import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class AppCacheImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const AppCacheImage({
    super.key,
    required this.imageUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        placeholder: (
          BuildContext context,
          String url,
        ) {
          return const SizedBox(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }
}
