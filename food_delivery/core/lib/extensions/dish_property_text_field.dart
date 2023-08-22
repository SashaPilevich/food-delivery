import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

extension DishPropertyTextFieldExtension on DishPropertyTextField {
  String get title {
    switch (this) {
      case DishPropertyTextField.title:
        return 'Title';
      case DishPropertyTextField.cost:
        return 'Price';
      case DishPropertyTextField.description:
        return 'Description';
      case DishPropertyTextField.category:
        return 'Category';
      case DishPropertyTextField.ingredients:
        return 'Ingredients';
      default:
        return '';
    }
  }

  Icon get icon {
    switch (this) {
      case DishPropertyTextField.title:
        return const Icon(Icons.title_sharp);
      case DishPropertyTextField.cost:
        return const Icon(Icons.price_change_outlined);
      case DishPropertyTextField.description:
        return const Icon(Icons.description_outlined);
      case DishPropertyTextField.category:
        return const Icon(Icons.dining_sharp);
      case DishPropertyTextField.ingredients:
        return const Icon(Icons.list_alt_outlined);
      default:
        return const Icon(Icons.error);
    }
  }

  TextEditingController get controller {
    switch (this) {
      case DishPropertyTextField.title:
        return TextEditingController();
      case DishPropertyTextField.cost:
        return TextEditingController();
      case DishPropertyTextField.description:
        return TextEditingController();
      case DishPropertyTextField.category:
        return TextEditingController();
      case DishPropertyTextField.ingredients:
        return TextEditingController();
      default:
        return TextEditingController();
    }
  }

  String getValueForField(DishPropertyTextField field, DishModel? dishModel) {
    switch (field) {
      case DishPropertyTextField.title:
        return dishModel?.title??'';
      case DishPropertyTextField.cost:
        return dishModel?.cost.toString()??'';
      case DishPropertyTextField.description:
        return dishModel?.description ?? '';
      case DishPropertyTextField.category:
        return dishModel?.category ?? '';
      case DishPropertyTextField.ingredients:
        return dishModel?.ingredients?.join('\n') ?? '';
      default:
        return '';
    }
  }
}
