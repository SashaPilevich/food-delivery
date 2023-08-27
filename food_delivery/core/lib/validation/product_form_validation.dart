import 'package:core/core.dart';

class ProductFormValidator {
  static String? Function(String?)? validate(DishPropertyTextField field) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        if (field == DishPropertyTextField.title ||
            field == DishPropertyTextField.description) {
          return 'adminPanelScreen.addSomeValue'.tr();
        }
      }
      if (field == DishPropertyTextField.cost) {
        if (int.tryParse(value!) == null) {
          return 'adminPanelScreen.haveToBeNumber'.tr();
        }
      }
      return null;
    };
  }
}
