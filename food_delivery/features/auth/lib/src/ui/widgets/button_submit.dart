import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ButtonSubmit({
    required this.onPressed,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        return state.formStatus is FormSubmitting
            ? const LoadingIndicator()
            : SizedBox(
                width: mediaQueryData.size.width * 0.9,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(label),
                ),
              );
      },
    );
  }
}
