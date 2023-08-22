import 'dart:io';

import 'package:data/data.dart';
import 'package:data/mappers/order_with_user_info_mapper.dart';
import 'package:domain/domain.dart';

class AdminPanelRepositoryImpl implements AdminPanelRepository {
  final FirebaseFirestoreDataProvider _firebaseFirestoreDataProvider;

  const AdminPanelRepositoryImpl({
    required FirebaseFirestoreDataProvider firebaseFirestoreDataProvider,
  }) : _firebaseFirestoreDataProvider = firebaseFirestoreDataProvider;

  @override
  Future<void> updateProduct({
    required DishModel dishModel,
  }) async {
    await _firebaseFirestoreDataProvider.updateProduct(
      dishEntity: DishMapper.toEntity(dishModel),
    );
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    final List<UserEntity> listOfUsers =
        await _firebaseFirestoreDataProvider.fetchAllUsers();
    return listOfUsers
        .map((UserEntity userEntity) => UserMapper.toModel(userEntity))
        .toList();
  }

  @override
  Future<void> updateUserRole({
    required String uid,
    required String role,
  }) async {
    await _firebaseFirestoreDataProvider.updateUserRole(
      uid: uid,
      role: role,
    );
  }

  @override
  Future<List<OrderWithUserInfoModel>> fetchAllOrders() async {
    final List<OrderWithUserInfoEntity> listOfOrders =
        await _firebaseFirestoreDataProvider.fetchAllOrders();
    return listOfOrders
        .map((OrderWithUserInfoEntity orderForAdminEntity) =>
            OrderWithUserInfoMapper.toModel(orderForAdminEntity))
        .toList();
  }

  @override
  Future<void> updateOrderStatus({
    required String uid,
    required bool isComplete,
  }) async {
    await _firebaseFirestoreDataProvider.updateOrderStatus(
      uid: uid,
      isComplete: isComplete,
    );
  }

  @override
  Future<void> addProduct({
    required DishModel dishModel,
  }) async {
    await _firebaseFirestoreDataProvider.addProduct(
      dishEntity: DishMapper.toEntity(dishModel),
    );
  }

  @override
  Future<String> uploadImage({
    required File imageUrl,
  }) async {
    return await _firebaseFirestoreDataProvider.uploadImage(
      imageUrl: imageUrl,
    );
  }

  @override
  Future<void> deleteProduct({
    required String id,
  }) async {
    await _firebaseFirestoreDataProvider.deleteProduct(id: id);
  }
}
