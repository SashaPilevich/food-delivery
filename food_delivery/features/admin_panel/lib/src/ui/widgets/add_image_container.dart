import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'upload_image.dart';

class AddImageContainer extends StatelessWidget {
  const AddImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppPadding.padding40,
        top: AppPadding.padding20,
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: AppSize.size20,
          ),
          InkWell(
            onTap: () {
              AppBottomSheet.show(
                context,
                const ImageUpload(),
              );
            },
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.add_a_photo_outlined,
                ),
                const SizedBox(
                  width: AppSize.size15,
                ),
                Text(
                  'adminPanelScreen.addImage'.tr(),
                  style: themeData.textTheme.labelMedium!.copyWith(
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
