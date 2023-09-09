import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CancelSaveButtons extends StatelessWidget {
  final VoidCallback onPressedSave;
  final VoidCallback onPressedCancel;

  const CancelSaveButtons({
    required this.onPressedSave,
    required this.onPressedCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: AppSize.size20,
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: onPressedCancel,
            icon: const Icon(Icons.cancel_outlined),
            label: Text(
              'adminPanelScreen.cancel'.tr(),
            ),
          ),
        ),
        const SizedBox(
          width: AppSize.size30,
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: onPressedSave,
            icon: const Icon(Icons.save_as_outlined),
            label: Text(
              'adminPanelScreen.save'.tr(),
            ),
          ),
        ),
        const SizedBox(
          width: AppSize.size20,
        ),
      ],
    );
  }
}
