// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String? Function(String?)? validator;
//   final TextEditingController textEditingController;
//   final String hintText;
//   final bool obscureText;
//   final Icon icon;

//   const CustomTextField({
//     required this.validator,
//     required this.textEditingController,
//     required this.hintText,
//     required this.obscureText,
//     required this.icon,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData themeData = Theme.of(context);

//     return TextFormField(
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         icon: icon,
//         iconColor: themeData.primaryColor,
//         hintText: hintText,
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: themeData.primaryColor,
//           ),
//         ),
//       ),
//       validator: validator,
//       controller: textEditingController,
//     );
//   }
// }
