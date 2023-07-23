import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AuthDecoration(
              imageUrl: 'assets/image/signup.png',
            ),
            Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: AppSize.size60,
                  ),
                  SignUpForm(formKey: _formKey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
