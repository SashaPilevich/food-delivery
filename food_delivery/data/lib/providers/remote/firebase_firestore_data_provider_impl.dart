import 'dart:io';
import 'package:core/core.dart';
import 'package:data/data.dart';

class FirebaseFirestoreDataProviderImpl
    implements FirebaseFirestoreDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const FirebaseFirestoreDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<DishEntity>> getAllDishes() async {
    final QuerySnapshot<Map<String, dynamic>> dataRef =
        await _firebaseFirestore.collection('dishes').get();
    return dataRef.docs
        .map((
          QueryDocumentSnapshot<Map<String, dynamic>> dish,
        ) =>
            DishEntity.fromFirebase(dish))
        .toList();
  }

  @override
  Future<void> addOrder(OrderEntity orderEntity) async {
    final CollectionReference ordersCollection = _firebaseFirestore
        .collection('users')
        .doc(orderEntity.id)
        .collection('orders');

    final DocumentReference<Object?> newOrderDocument = ordersCollection.doc();

    await newOrderDocument.set({
      'id': newOrderDocument.id,
      'cart': orderEntity.cart.toJson(),
      'dateTime': orderEntity.dateTime,
      'isComplete': orderEntity.isComplete,
    });
  }

  @override
  Future<List<OrderEntity>> fetchOrders(String uid) async {
    final QuerySnapshot<Map<String, dynamic>> listOfDocuments =
        await _firebaseFirestore
            .collection('users')
            .doc(uid)
            .collection('orders')
            .get();

    return listOfDocuments.docs.map((
      QueryDocumentSnapshot<Map<String, dynamic>> document,
    ) {
      return OrderEntity.fromFirebase(document);
    }).toList();
  }

  @override
  Future<void> saveUser({
    required String uid,
    required String? email,
    required String? userName,
  }) async {
    final DocumentReference<Map<String, dynamic>> userDataFirebase =
        _firebaseFirestore.collection('users').doc(
              uid,
            );
    final Map<String, String?> userData = {
      'uid': uid,
      'email': email,
      'name': userName,
      'role': UserRole.user.getStringValue(),
    };
    final DocumentSnapshot<Map<String, dynamic>> user =
        await userDataFirebase.get();
    if (!user.exists) {
      userDataFirebase.set(userData);
    }
  }

  @override
  Future<UserEntity> getUser({
    required String uid,
  }) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await _firebaseFirestore.collection('users').doc(uid).get();
    final Map<String, dynamic>? userData = userDoc.data();
    final UserEntity userEntity = UserEntity(
      uid: uid,
      email: userData?['email'] ?? '',
      userName: userData?['name'] ?? '',
      role: userData?['role'] ?? '',
    );
    return userEntity;
  }

  @override
  Future<void> addProduct({
    required DishEntity dishEntity,
  }) async {
    final CollectionReference<Map<String, dynamic>> productsDataFirebase =
        _firebaseFirestore.collection('dishes');

    final DocumentReference<Map<String, dynamic>> newDocumentRef =
        productsDataFirebase.doc();

    await newDocumentRef.set({
      "id": newDocumentRef.id,
      "title": dishEntity.title,
      "imageUrl": dishEntity.imageUrl,
      "cost": dishEntity.cost,
      "description": dishEntity.description,
      "ingredients": dishEntity.ingredients,
      "category": dishEntity.category,
    });
  }

  @override
  Future<void> updateProduct({
    required DishEntity dishEntity,
  }) async {
    final CollectionReference<Map<String, dynamic>> productsDataFirebase =
        _firebaseFirestore.collection('dishes');

    await productsDataFirebase.doc(dishEntity.id).update({
      "title": dishEntity.title,
      "imageUrl": dishEntity.imageUrl,
      "cost": dishEntity.cost,
      "description": dishEntity.description,
      "ingredients": dishEntity.ingredients,
      "category": dishEntity.category,
    });
  }

  @override
  Future<void> deleteProduct({
    required String id,
  }) async {
    await _firebaseFirestore.collection('dishes').doc(id).delete();
  }

  @override
  Future<String> uploadImage({
    required File imageUrl,
  }) async {
    final Reference reference =
        FirebaseStorage.instance.ref().child('dishImages').child('$imageUrl');

    await reference.putFile(imageUrl);

    final String imageUrlFromRemote = await reference.getDownloadURL();

    return imageUrlFromRemote;
  }

  @override
  Future<List<UserEntity>> fetchAllUsers() async {
    final QuerySnapshot<Map<String, dynamic>> dataRef =
        await _firebaseFirestore.collection('users').get();

    return dataRef.docs.map((
      QueryDocumentSnapshot<Map<String, dynamic>> user,
    ) {
      return UserEntity.fromFirebase(user);
    }).toList();
  }

  @override
  Future<void> updateUserRole({
    required String uid,
    required String role,
  }) async {
    final CollectionReference<Map<String, dynamic>> usersDataFirebase =
        _firebaseFirestore.collection('users');

    await usersDataFirebase.doc(uid).update({
      "role": role,
    });
  }

  @override
  Future<List<OrderWithUserInfoEntity>> fetchAllOrders() async {
    final QuerySnapshot<Map<String, dynamic>> listOfDocuments =
        await _firebaseFirestore.collection('users').get();
    List<OrderWithUserInfoEntity> allOrders = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> userDoc
        in listOfDocuments.docs) {
      final CollectionReference<Map<String, dynamic>> ordersCollection =
          userDoc.reference.collection('orders');
      final QuerySnapshot<Map<String, dynamic>> ordersSnapshot =
          await ordersCollection.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> orderDoc
          in ordersSnapshot.docs) {
        final Map<String, dynamic> orderData = orderDoc.data();
        final Map<String, dynamic> userData = userDoc.data();

        final UserEntity userEntity = UserEntity.fromJson(userData);
        final OrderEntity orderEntity = OrderEntity.fromJson(orderData);

        final OrderWithUserInfoEntity orderForAdmin = OrderWithUserInfoEntity(
          userEntity: userEntity,
          orderEntity: orderEntity,
        );

        allOrders.add(orderForAdmin);
      }
    }
    return allOrders;
  }

  @override
  Future<void> updateOrderStatus({
    required String uid,
    required bool isComplete,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> usersSnapshot =
        await _firebaseFirestore.collection('users').get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> userDoc
        in usersSnapshot.docs) {
      final CollectionReference<Map<String, dynamic>> ordersCollection =
          userDoc.reference.collection('orders');
      final QuerySnapshot<Map<String, dynamic>> ordersSnapshot =
          await ordersCollection.get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> orderDoc
          in ordersSnapshot.docs) {
        final String orderUid = orderDoc.id;

        if (orderUid == uid) {
          await orderDoc.reference.update({
            'isComplete': isComplete,
          });
        }
      }
    }
  }
}
