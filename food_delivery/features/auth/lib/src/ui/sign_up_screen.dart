import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AuthDecoration(
              imageUrl: 'assets/image/signup.png',
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: AppSize.size60,
                  ),
                  SignUpForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
