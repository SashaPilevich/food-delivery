import 'package:core/core.dart';
import 'package:data/data.dart';

class OrdersDataProviderImpl implements OrdersDataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const OrdersDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

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
}
