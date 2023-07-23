import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AuthDecoration(
              imageUrl: 'assets/image/dinner.png',
            ),
            Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: AppSize.size60,
                  ),
                  SignInForm(formKey: _formKey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
