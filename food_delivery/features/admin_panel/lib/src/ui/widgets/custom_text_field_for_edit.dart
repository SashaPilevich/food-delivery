import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomTextFieldForEdit extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final Icon icon;

  const CustomTextFieldForEdit({
    required this.textEditingController,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Card(
      child: ExpansionTile(
        leading: icon,
        title: Text(title),
        childrenPadding: const EdgeInsets.all(
          AppPadding.padding20,
        ),
        children: <Widget>[
          TextFormField(
            minLines: TextFieldLines.lines1,
            maxLines: TextFieldLines.lines10,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: themeData.primaryColor,
                ),
              ),
            ),
            controller: textEditingController,
            
          ),
        ],
      ),
    );
  }
}
