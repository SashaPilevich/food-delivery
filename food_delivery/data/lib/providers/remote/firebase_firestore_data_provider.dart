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
}
