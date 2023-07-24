import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.isLogged) {
            bloc.add(
              NavigateToHomePage(context: context),
            );
          } else {
            bloc.add(
              NavigateToSignInScreen(context: context),
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
