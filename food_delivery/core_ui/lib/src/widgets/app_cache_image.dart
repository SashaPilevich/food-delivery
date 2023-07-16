import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class AppCacheImage extends StatelessWidget {
  final String src;
  final double height;

  const AppCacheImage({
    super.key,
    required this.src,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: src,
        placeholder: (
          BuildContext context,
          String url,
        ) =>
            const SizedBox(
          child: LoadingIndicator(),
        ),
        height: height,
      ),
    );
  }
}
