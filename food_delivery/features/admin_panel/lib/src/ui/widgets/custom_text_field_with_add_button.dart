import 'package:admin_panel/src/ui/widgets/custom_text_field.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWithAddButton extends StatefulWidget {
  final DishModel dishModel;
  final Function(List<String>) onIngredientsUpdated;

  const CustomTextFieldWithAddButton({
    required this.dishModel,
    required this.onIngredientsUpdated,
    super.key,
  });

  @override
  State<CustomTextFieldWithAddButton> createState() =>
      _CustomTextFieldWithAddButtonState();
}

class _CustomTextFieldWithAddButtonState
    extends State<CustomTextFieldWithAddButton> {
  List<TextEditingController> listOfControllers = [];
  List<String> ingredients = [];

  @override
  void initState() {
    super.initState();
    final List<String> ingredientsFromDishModel =
        widget.dishModel.ingredients ?? [];
    if (ingredientsFromDishModel.isNotEmpty) {
      listOfControllers = ingredientsFromDishModel.map(
        (ingredient) {
          return TextEditingController(text: ingredient);
        },
      ).toList();
    } else {
      listOfControllers = [
        TextEditingController(),
      ];
    }
  }

  void removeIngredient(int index) {
    setState(() {
      listOfControllers[index].clear();
      listOfControllers[index].dispose();
      listOfControllers.removeAt(index);
      updateListOfIngredients();
    });
  }

  void updateListOfIngredients() {
    ingredients = listOfControllers.map(
      (TextEditingController controller) {
        return controller.text;
      },
    ).toList();
    widget.onIngredientsUpdated(ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    listOfControllers.add(
                      TextEditingController(),
                    );
                  });
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listOfControllers.length,
            itemBuilder: (_, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.padding6,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        textEditingController: listOfControllers[index],
                        hintText: 'adminPanelScreen.addIngredient'.tr(),
                        icon: const Icon(
                          Icons.list_alt_outlined,
                          color: AppColors.pink,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'adminPanelScreen.addSomeValue'.tr();
                          }
                          return null;
                        },
                        onChanged: (_) {
                          updateListOfIngredients();
                        },
                      ),
                    ),
                    listOfControllers[index].text != ''
                        ? IconButton(
                            onPressed: () {
                              removeIngredient(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: AppColors.pink,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (TextEditingController controller in listOfControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
