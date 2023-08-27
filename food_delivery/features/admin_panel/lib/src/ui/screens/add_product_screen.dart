import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:admin_panel/src/ui/widgets/product_form.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'adminPanelScreen.addProducts'.tr(),
      ),
      body: ProductForm(
        onSave: (DishModel dishModel) {
          adminPanelBloc.add(
            AddProduct(dishModel: dishModel),
          );
          AppSnackbar.show(
            context,
            'adminPanelScreen.productAdded'.tr(),
          );
        },
      ),
    );
  }
}
