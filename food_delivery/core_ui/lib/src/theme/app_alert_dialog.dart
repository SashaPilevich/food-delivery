import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppAlertDialog {
  static void show(BuildContext context, String message, VoidCallback onDelete,
      VoidCallback onCancel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: onCancel,
              child: Text(
                'adminPanelScreen.cancel'.tr(),
              ),
            ),
            TextButton(
              onPressed: onDelete,
              child: Text(
                'adminPanelScreen.delete'.tr(),
              ),
            ),
          ],
        );
      },
    );
  }
}
