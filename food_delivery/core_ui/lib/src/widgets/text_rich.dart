import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  final List<String>? listOfIngredients;

  const CustomTextRich({
    required this.listOfIngredients,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        children: [
          ...List.generate(
            listOfIngredients?.length ?? 0,
            (index) => TextSpan(
              text: '\u2022${listOfIngredients?[index] ?? ''}',
              style: textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
