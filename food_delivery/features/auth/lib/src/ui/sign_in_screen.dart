import 'package:auth/auth.dart';
import 'package:auth/src/ui/widgets/reset_password_form.dart';
import 'package:auth/src/ui/widgets/sign_up_form.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'widgets/auth_header.dart';
import 'widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AuthHeader(
              imageUrl: 'assets/image/dinner.png',
            ),
            const SizedBox(
              height: AppSize.size30,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (_, AuthState state) {
                      if (state.isResetPasswordPage) {
                        return const ResetPasswordForm();
                      }
                      if (state.isSignInPage) {
                        return const SignInForm();
                      }
                      return const SignUpForm();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
