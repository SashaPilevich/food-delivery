import 'package:core/core.dart';
import 'package:data/entity/dish_entity.dart';

class DataProvider {
  //constructor?
  Future<List<DishEntity>> getAllDishes() async {
    final QuerySnapshot<Map<String, dynamic>> dataRef =
        await FirebaseFirestore.instance.collection('dishes').get();
    return dataRef.docs.map((e) => DishEntity.fromFirebase(e)).toList();
  }
}
