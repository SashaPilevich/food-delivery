import 'dart:io';

import 'package:domain/domain.dart';

abstract class AdminPanelRepository {
  Future<void> updateProduct({
    required DishModel dishModel,
  });
  Future<List<UserModel>> fetchAllUsers();
  Future<void> updateUserRole({
    required String uid,
    required String role,
  });
  Future<List<OrderWithUserInfoModel>> fetchAllOrders();
  Future<void> updateOrderStatus({
    required String uid,
    required bool isComplete,
  });
  Future<void> addProduct({
    required DishModel dishModel,
  });
  Future<String> uploadImage({
    required File imageUrl,
  });
  Future<void> deleteProduct({
    required String id,
  });
}
