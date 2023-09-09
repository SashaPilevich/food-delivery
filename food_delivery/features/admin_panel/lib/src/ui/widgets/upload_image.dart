import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  const ImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);

    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (_, AdminPanelState state) {
        return Container(
          padding: const EdgeInsets.only(
            top: AppPadding.padding20,
          ),
          height: state.selectedImage.path == ''
              ? mediaQueryData.size.height * 0.2
              : mediaQueryData.size.height * 0.3,
          width: mediaQueryData.size.width * 0.7,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      state.selectedImage.path == ''
                          ? const SizedBox.shrink()
                          : Expanded(
                              child: Image.file(
                                state.selectedImage,
                                height: mediaQueryData.size.height * 0.13,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  adminPanelBloc.add(
                    const SelectImage(),
                  );
                },
                icon: const Icon(
                  Icons.add_a_photo_outlined,
                ),
                label: Text(
                  'adminPanelScreen.selectImage'.tr(),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  adminPanelBloc.add(
                    UploadImage(
                      imageFile: state.selectedImage,
                    ),
                  );
                  AppSnackbar.show(
                    context,
                    'adminPanelScreen.imageUpload'.tr(),
                  );
                  adminPanelBloc.add(
                    const NavigateToCurrentScreen(),
                  );
                },
                icon: const Icon(Icons.download),
                label: Text(
                  'adminPanelScreen.uploadImage'.tr(),
                ),
              ),
              const SizedBox(
                height: AppSize.size30,
              ),
            ],
          ),
        );
      },
    );
  }
}
