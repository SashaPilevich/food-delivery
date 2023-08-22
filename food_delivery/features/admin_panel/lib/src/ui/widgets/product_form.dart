import 'package:admin_panel/src/bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'add_image_container.dart';
import 'cancel_save_buttons.dart';

class ProductForm extends StatefulWidget {
  final DishModel? dishModel;
  final Function(DishModel dishModel) onSave;
  final Widget Function(
    DishPropertyTextField field,
    TextEditingController controller,
  ) textFieldBuilder;

  const ProductForm({
    this.dishModel,
    required this.onSave,
    required this.textFieldBuilder,
    super.key,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Map<DishPropertyTextField, TextEditingController>
      textEditingControllers = {};

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

                return widget.textFieldBuilder(
                  field,
                  textEditingControllers[field] ?? TextEditingController(),
                );
              },
            ),
            const AddImageContainer(),
            BlocBuilder<AdminPanelBloc, AdminPanelState>(
              builder: (_, AdminPanelState state) {
                return CancelSaveButtons(
                  onPressedSave: () {
                    widget.onSave(
                      DishModel(
                        title:
                            textEditingControllers[DishPropertyTextField.title]
                                    ?.text ??
                                '',
                        imageUrl: state.imageUrl == ''
                            ? widget.dishModel?.imageUrl ?? ''
                            : state.imageUrl,
                        cost: int.parse(
                            textEditingControllers[DishPropertyTextField.cost]
                                    ?.text ??
                                ''),
                        category: textEditingControllers[
                                DishPropertyTextField.category]
                            ?.text,
                        ingredients: textEditingControllers[
                                DishPropertyTextField.ingredients]
                            ?.text
                            .split('\n'),
                        description: textEditingControllers[
                                DishPropertyTextField.description]
                            ?.text,
                        id: widget.dishModel?.id ?? '',
                      ),
                    );
                    adminPanelBloc.add(
                      const NavigateToCurrentScreen(),
                    );
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
