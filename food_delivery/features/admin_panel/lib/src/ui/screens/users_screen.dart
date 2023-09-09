import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:admin_panel/src/ui/widgets/edit_user_role_form.dart';
import 'package:admin_panel/src/ui/widgets/user_card.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'adminPanelScreen.users'.tr(),
      ),
      body: BlocBuilder<AdminPanelBloc, AdminPanelState>(
        builder: (_, AdminPanelState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(
                    AppPadding.padding10,
                  ),
                  itemCount: state.listOfUsers.length,
                  itemBuilder: (_, int index) {
                    return UserCard(
                      userModel: state.listOfUsers[index],
                      onPressed: () {
                        AppBottomSheet.show(
                          context,
                          EditUserRoleForm(
                            onSave: (String role) {
                              adminPanelBloc.add(
                                UpdateUserRole(
                                  role: role,
                                  uid: state.listOfUsers[index].uid,
                                ),
                              );
                              AppSnackbar.show(
                                context,
                                'adminPanelScreen.userRoleChanged'.tr(),
                              );
                            },
                            role: state.listOfUsers[index].role,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
