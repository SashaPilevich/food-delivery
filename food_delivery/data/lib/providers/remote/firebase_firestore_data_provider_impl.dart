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
}
