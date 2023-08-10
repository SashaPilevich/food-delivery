import 'package:auth/auth.dart';
import 'package:auth/src/ui/widgets/reset_password_form.dart';
import 'package:auth/src/ui/widgets/sign_up_form.dart';
import 'package:core/core.dart';
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
            const AuthHeader(),
            Center(
              child: Column(
                children: <Widget>[
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (_, AuthState state) {
                      if (state.isResetPasswordPage) {
                        return const AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeIn,
                          child: ResetPasswordForm(),
                        );
                      }
                      return AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        switchInCurve: Curves.easeIn,
                        switchOutCurve: Curves.easeIn,
                        child: state.isSignInPage
                            ? const SignInForm()
                            : const SignUpForm(),
                      );
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
