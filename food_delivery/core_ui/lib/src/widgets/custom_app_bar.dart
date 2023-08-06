import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    this.title = '',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);
    final ThemeData themeData = Theme.of(context);

    return AppBar(
      backgroundColor: themeData.primaryColor,
      shadowColor: AppColors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.padding10,
        ),
        child: Text(
          title,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            bloc.add(SignOutSubmitted());
            bloc.add(
              NavigateToSignInScreen(),
            );
          },
          icon: const Icon(
            Icons.logout,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
