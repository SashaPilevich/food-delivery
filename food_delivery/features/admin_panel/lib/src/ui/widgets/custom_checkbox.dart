import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isComplete;
  final Function(bool) onChanged;

  const CustomCheckBox({
    required this.onChanged,
    required this.isComplete,
    Key? key,
  }) : super(key: key);

  @override
  CustomCheckBoxState createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isComplete;
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.isComplete;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CheckboxMenuButton(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged(value!);
          },
          child: Text(
            'adminPanelScreen.changeOrderStatus'.tr(),
          ),
        ),
      ],
    );
  }
}
