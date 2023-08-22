import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onPressed;

  const UserCard({
    required this.userModel,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding15,
          vertical: AppPadding.padding20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userModel.userName,
                  style: themeData.textTheme.titleMedium,
                ),
                Text(
                  userModel.email,
                  style: themeData.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(
                Icons.verified_user_outlined,
              ),
              label: Text(
                'adminPanelScreen.changeRole'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
