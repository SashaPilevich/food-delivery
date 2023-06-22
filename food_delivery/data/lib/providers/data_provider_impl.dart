part of 'data_provider.dart';

class _DataProvider implements DataProvider {
  final FirebaseFirestore _firebaseFirestore;

  _DataProvider(this._firebaseFirestore);

  @override
  Future<List<DishEntity>> getAllDishes() async{
    final QuerySnapshot<Map<String, dynamic>> dataRef =
        await _firebaseFirestore.collection('dishes').get();
    return dataRef.docs.map((e) => DishEntity.fromFirebase(e)).toList();
  }
}
