import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ButtonAddProducts extends StatelessWidget {
  final VoidCallback onPressed;

  const ButtonAddProducts({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.padding20,
          right: AppPadding.padding20,
        ),
        child: FilledButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.add),
          label: Text(
            'adminPanelScreen.addProducts'.tr(),
          ),
        ),
      ),
    );
  }
}
