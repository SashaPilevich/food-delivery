import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:admin_panel/src/ui/widgets/cancel_save_buttons.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EditUserRoleForm extends StatefulWidget {
  final String role;
  final Function(String role) onSave;

  const EditUserRoleForm({
    required this.role,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<EditUserRoleForm> createState() => _EditUserRoleFormState();
}

class _EditUserRoleFormState extends State<EditUserRoleForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = widget.role;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding10,
        vertical: AppPadding.padding40,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField<UserRole>(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: themeData.primaryColor,
                  ),
                ),
              ),
              value: UserRoleExtension.fromStringValue(
                selectedRole,
              ),
              items: UserRole.values.map((UserRole role) {
                return DropdownMenuItem<UserRole>(
                  value: role,
                  child: Text(
                    role.getStringValue(),
                  ),
                );
              }).toList(),
              onChanged: (UserRole? value) {
                if (value != null) {
                  selectedRole = value.getStringValue();
                }
              },
            ),
            const SizedBox(
              height: AppSize.size30,
            ),
            CancelSaveButtons(
              onPressedSave: () {
                widget.onSave(selectedRole);
                adminPanelBloc.add(
                  const NavigateToCurrentScreen(),
                );
              },
              onPressedCancel: () {
                adminPanelBloc.add(
                  const NavigateToCurrentScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
