import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'authScreens.resetPassword'.tr(),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AuthDecoration(
              imageUrl: 'assets/image/forgot-password.png',
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: AppSize.size60,
                  ),
                  ResetPasswordForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
