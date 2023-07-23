import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state.isLogged) {
            context.replaceRoute(
              const HomePageRoute(),
            );
          } else {
            context.replaceRoute(
              SignInScreenRoute(),
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
