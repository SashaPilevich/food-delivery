part of 'admin_panel_bloc.dart';

abstract class AdminPanelEvent {
  const AdminPanelEvent();
}

class LoadProducts extends AdminPanelEvent {
  const LoadProducts();
}

class UpdateProduct extends AdminPanelEvent {
  final DishModel dishModel;

  const UpdateProduct({
    required this.dishModel,
  });
}

class LoadUsers extends AdminPanelEvent {
  const LoadUsers();
}

class UpdateUserRole extends AdminPanelEvent {
  final String uid;
  final String role;

  const UpdateUserRole({
    required this.uid,
    required this.role,
  });
}

class InitOrders extends AdminPanelEvent {
  const InitOrders();
}

class LoadOrders extends AdminPanelEvent {
  const LoadOrders();
}

class UpdateOrderStatus extends AdminPanelEvent {
  final String uid;
  final bool isComplete;

  const UpdateOrderStatus({
    required this.uid,
    required this.isComplete,
  });
}

class SelectImage extends AdminPanelEvent {
  const SelectImage();
}

class UploadImage extends AdminPanelEvent {
  final File imageFile;

  const UploadImage({
    required this.imageFile,
  });
}

class AddProduct extends AdminPanelEvent {
  final DishModel dishModel;

  const AddProduct({
    required this.dishModel,
  });
}

class DeleteProduct extends AdminPanelEvent {
  final String id;

  const DeleteProduct({
    required this.id,
  });
}

class NavigateToAddProductsScreen extends AdminPanelEvent {
  const NavigateToAddProductsScreen();
}

class NavigateToCurrentScreen extends AdminPanelEvent {
  const NavigateToCurrentScreen();
}

class UpdateCategoryList extends AdminPanelEvent {
  final String newCategoryItem;

  const UpdateCategoryList({
    required this.newCategoryItem,
  });
}
