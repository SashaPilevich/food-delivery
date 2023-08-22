import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomTextFieldForAdd extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Icon icon;

  const CustomTextFieldForAdd({
    required this.textEditingController,
    required this.hintText,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding20,
        vertical: AppPadding.padding6,
      ),
      margin: const EdgeInsets.only(
        bottom: AppMargin.margin20,
      ),
      width: mediaQueryData.size.width,
      child: TextFormField(
        maxLines: TextFieldLines.lines10,
        minLines: TextFieldLines.lines1,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: themeData.primaryColor,
            ),
          ),
          border: InputBorder.none,
          hintStyle: themeData.textTheme.labelMedium!.copyWith(
            color:AppColors.mediumGrey,
          ),
          hintText: hintText,
          icon: icon,
          iconColor: themeData.primaryColor,
        ),
        controller: textEditingController,
      ),
    );
  }
}
