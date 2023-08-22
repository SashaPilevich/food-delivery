import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.isLogged && !state.isAdmin) {
            authBloc.add(
              NavigateToHomePage(),
            );
          } else if (state.isLogged && state.isAdmin) {
            authBloc.add(
              NavigateToAdminPanelScreen(),
            );
          } else {
            authBloc.add(
              NavigateToSignInScreen(),
            );
          }
        },
        child: const Center(
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
