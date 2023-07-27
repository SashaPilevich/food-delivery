import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AuthDecoration(
              imageUrl: 'assets/image/dinner.png',
            ),
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: AppSize.size60,
                  ),
                  SignInForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
