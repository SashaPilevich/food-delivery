import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

extension DishPropertyTextFieldExtension on DishPropertyTextField {
  String get title {
    switch (this) {
      case DishPropertyTextField.title:
        return 'adminPanelScreen.title'.tr();
      case DishPropertyTextField.cost:
        return 'adminPanelScreen.price'.tr();
      case DishPropertyTextField.description:
        return 'adminPanelScreen.description'.tr();
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
      default:
        return TextEditingController();
    }
  }

  String getValueForField(DishPropertyTextField field, DishModel? dishModel) {
    switch (field) {
      case DishPropertyTextField.title:
        return dishModel?.title ?? '';
      case DishPropertyTextField.cost:
        return dishModel?.cost.toString() ?? '';
      case DishPropertyTextField.description:
        return dishModel?.description ?? '';
      default:
        return '';
    }
  }
}
