import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ImageForEmptyState extends StatelessWidget {
  final String imageUrl;

  const ImageForEmptyState({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.padding40,
        bottom: AppPadding.padding40,
      ),
      child: Image.asset(
        imageUrl,
        height: mediaQueryData.size.height * 0.25,
      ),
    );
  }
}
