import 'package:admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:admin_panel/src/ui/widgets/custom_text_field_for_edit.dart';
import 'package:admin_panel/src/ui/widgets/product_card.dart';
import 'package:admin_panel/src/ui/widgets/product_form.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminPanelBloc adminPanelBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'adminPanelScreen.products'.tr(),
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
                  itemCount: state.listOfProducts.length,
                  itemBuilder: (_, int index) {
                    return ProductCard(
                      dishModel: state.listOfProducts[index],
                      onDelete: () {
                        AppAlertDialog.show(
                          context,
                          'adminPanelScreen.areYouSure'.tr(),
                          () {
                            adminPanelBloc.add(
                              DeleteProduct(id: state.listOfProducts[index].id),
                            );
                            adminPanelBloc.add(
                              const NavigateToCurrentScreen(),
                            );
                            AppSnackbar.show(
                              context,
                              'adminPanelScreen.removeProduct'.tr(),
                            );
                          },
                          () {
                            adminPanelBloc.add(
                              const NavigateToCurrentScreen(),
                            );
                          },
                        );
                      },
                      onEdit: () {
                        AppBottomSheet.show(
                          context,
                          ProductForm(
                            dishModel: state.listOfProducts[index],
                            onSave: (DishModel dishModel) {
                              adminPanelBloc.add(
                                UpdateProduct(
                                  dishModel: dishModel,
                                ),
                              );
                            },
                            textFieldBuilder: (DishPropertyTextField field,
                                TextEditingController controller) {
                              return CustomTextFieldForEdit(
                                textEditingController: controller,
                                title: field.title,
                                icon: field.icon,
                              );
                            },
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
