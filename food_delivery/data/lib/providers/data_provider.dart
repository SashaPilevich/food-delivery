import 'package:core/core.dart';
import 'package:data/entity/dish_entity.dart';

class DataProvider {
  final FirebaseFirestore firebaseFirestore;
  const DataProvider(
    this.firebaseFirestore,
  );

  Future<List<DishEntity>> getAllDishes() async {
    final QuerySnapshot<Map<String, dynamic>> dataRef =
        await firebaseFirestore.collection('dishes').get();
    return dataRef.docs.map((e) => DishEntity.fromFirebase(e)).toList();
  }
}
