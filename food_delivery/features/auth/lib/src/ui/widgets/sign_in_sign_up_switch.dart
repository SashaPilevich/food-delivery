import 'package:flutter/material.dart';

class SignInSignUpSwitch extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final String title;

  const SignInSignUpSwitch({
    required this.onPressed,
    required this.label,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        TextButton(
          onPressed: onPressed,
          child: Text(label),
        )
      ],
    );
  }
}
