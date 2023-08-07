import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'animated_image.dart';
import 'image_for_empty_state.dart';

class EmptyContent extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  final String imageUrl;

  const EmptyContent({
    required this.onPressed,
    required this.title,
    required this.imageUrl,
    super.key,
  });

  @override
  State<EmptyContent> createState() => _EmptyContentState();
}

class _EmptyContentState extends State<EmptyContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 800,
      ),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SlideTransition(
            position: _animation,
            child: Column(
              children: <Widget>[
                Text(
                  widget.title,
                  style: themeData.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: AppSize.size30,
                ),
                AnimatedImage(
                  child: ImageForEmptyState(
                    imageUrl: widget.imageUrl,
                  ),
                ),
                const SizedBox(
                  height: AppSize.size30,
                ),
                FilledButton(
                  onPressed: widget.onPressed,
                  style: FilledButton.styleFrom(
                    textStyle: themeData.textTheme.labelMedium,
                  ),
                  child: Text(
                    'cartScreen.chooseDishes'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
