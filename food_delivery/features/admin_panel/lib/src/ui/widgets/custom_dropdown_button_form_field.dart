import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  final Function(String) onChanged;
  final String initialValue;

  const CustomDropdownButtonFormField({
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  @override
  State<CustomDropdownButtonFormField> createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);

    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (_, AdminPanelState state) {
        return SizedBox(
          width: mediaQueryData.size.width * 0.85,
          child: DropdownButtonFormField(
            items: <DropdownMenuItem<String>>[
              ...List.generate(
                state.categories.length,
                ((int index) {
                  return DropdownMenuItem(
                    value: state.categories[index],
                    child: Text(
                      state.categories[index],
                    ),
                  );
                }),
              ),
              DropdownMenuItem<String>(
                child: SizedBox(
                  width: mediaQueryData.size.width * 0.65,
                  child: TextField(
                    onEditingComplete: () {
                      adminPanelBloc.add(
                        UpdateCategoryList(
                          newCategoryItem: textEditingController.text,
                        ),
                      );
                      textEditingController.clear();
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: widget.initialValue,
                      border: InputBorder.none,
                      hintStyle: themeData.textTheme.labelMedium!.copyWith(
                        color: widget.initialValue == 'adminPanelScreen.category'.tr()
                            ? AppColors.mediumGrey
                            : AppColors.pink,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            onChanged: (String? item) {
              widget.onChanged(item ?? '');
            },
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: themeData.primaryColor,
                ),
              ),
              hintText: 'adminPanelScreen.category'.tr(),
              hintStyle: themeData.textTheme.labelMedium!.copyWith(
                color: AppColors.mediumGrey,
              ),
              icon: const Icon(
                Icons.dining_sharp,
                color: AppColors.pink,
              ),
            ),
          ),
        );
      },
    );
  }
}
