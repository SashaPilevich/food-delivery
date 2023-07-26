import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'authScreens.resetPassword'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AuthDecoration(
              imageUrl: 'assets/image/forgot-password.png',
            ),
            Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: AppSize.size60,
                  ),
                  ResetPasswordForm(formKey: _formKey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}