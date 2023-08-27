import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:admin_panel/src/ui/widgets/custom_dropdown_button_form_field.dart';
import 'package:admin_panel/src/ui/widgets/custom_text_field_with_add_button.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'add_image_container.dart';
import 'cancel_save_buttons.dart';
import 'custom_text_field.dart';

class ProductForm extends StatefulWidget {
  final DishModel? dishModel;
  final Function(DishModel dishModel) onSave;

  const ProductForm({
    this.dishModel,
    required this.onSave,
    super.key,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<DishPropertyTextField, TextEditingController>
      textEditingControllers = {};
  List<String>? ingredients;
  String? selectedCategory;

  @override
  void initState() {
    super.initState();

    for (DishPropertyTextField field in DishPropertyTextField.values) {
      textEditingControllers[field] = field.controller;
      textEditingControllers[field]?.text = field.getValueForField(
        field,
        widget.dishModel,
      );
    }
    ingredients = widget.dishModel?.ingredients ?? [];
    selectedCategory = widget.dishModel?.category;
  }

  @override
  Widget build(BuildContext context) {
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
            ...List.generate(
              DishPropertyTextField.values.length,
              (int index) {
                final DishPropertyTextField field =
                    DishPropertyTextField.values[index];
                return CustomTextField(
                  textEditingController:
                      textEditingControllers[field] ?? TextEditingController(),
                  hintText: field.title,
                  icon: field.icon,
                  validator: ProductFormValidator.validate(field),
                );
              },
            ),
            const SizedBox(
              height: AppSize.size10,
            ),
            CustomDropdownButtonFormField(
              initialValue: widget.dishModel?.category ??
                  'adminPanelScreen.category'.tr(),
              onChanged: (String category) {
                return selectedCategory = category;
              },
            ),
            CustomTextFieldWithAddButton(
              dishModel: widget.dishModel ?? DishModel.empty(),
              onIngredientsUpdated: (
                List<String>? ingredientsFromTextFields,
              ) {
                return ingredients = ingredientsFromTextFields;
              },
            ),
            const AddImageContainer(),
            BlocBuilder<AdminPanelBloc, AdminPanelState>(
              builder: (_, AdminPanelState state) {
                return CancelSaveButtons(
                  onPressedSave: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSave(
                        DishModel(
                          title: textEditingControllers[
                                      DishPropertyTextField.title]
                                  ?.text ??
                              '',
                          imageUrl: state.imageUrl == ''
                              ? widget.dishModel?.imageUrl ?? ''
                              : state.imageUrl,
                          cost: int.parse(
                              textEditingControllers[DishPropertyTextField.cost]
                                      ?.text ??
                                  ''),
                          category: selectedCategory,
                          ingredients: ingredients,
                          description: textEditingControllers[
                                  DishPropertyTextField.description]
                              ?.text,
                          id: widget.dishModel?.id ?? '',
                        ),
                      );
                      adminPanelBloc.add(
                        const NavigateToCurrentScreen(),
                      );
                    }
                  },
                  onPressedCancel: () {
                    adminPanelBloc.add(
                      const NavigateToCurrentScreen(),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (DishPropertyTextField field in DishPropertyTextField.values) {
      field.controller.dispose();
    }
    super.dispose();
  }
}
