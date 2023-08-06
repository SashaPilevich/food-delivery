part of 'data_provider.dart';

class DataProviderImpl implements DataProvider {
  final FirebaseFirestore _firebaseFirestore;

  const DataProviderImpl({
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
}
