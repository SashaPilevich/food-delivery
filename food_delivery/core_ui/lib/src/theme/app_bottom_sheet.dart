import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> show(BuildContext context, Widget contentWidget) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            AppSize.size20,
          ),
        ),
      ),
      context: context,
      builder: (_) {
        return contentWidget;
      },
    );
  }
}
