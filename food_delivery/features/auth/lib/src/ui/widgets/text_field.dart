import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const CustomTextField({
    required this.onChanged,
    required this.validator,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        icon: icon,
        iconColor: themeData.primaryColor,
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: themeData.primaryColor,
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
