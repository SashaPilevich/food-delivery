import 'dart:io';

import 'package:data/data.dart';

abstract class FirebaseFirestoreDataProvider {
  Future<List<DishEntity>> getAllDishes();
  Future<void> addOrder(OrderEntity orderEntity);
  Future<List<OrderEntity>> fetchOrders(String uid);
  Future<void> saveUser({
    required String uid,
    required String? email,
    required String? userName,
  });
  Future<UserEntity> getUser({
    required String uid,
  });
  Future<void> addProduct({
    required DishEntity dishEntity,
  });
  Future<void> updateProduct({
    required DishEntity dishEntity,
  });
  Future<void> deleteProduct({
    required String id,
  });
  Future<String> uploadImage({
    required File imageUrl,
  });
  Future<List<UserEntity>> fetchAllUsers();
  Future<void> updateUserRole({
    required String uid,
    required String role,
  });
  Future<List<OrderWithUserInfoEntity>> fetchAllOrders();
  Future<void> updateOrderStatus({
    required String uid,
    required bool isComplete,
  });
}
