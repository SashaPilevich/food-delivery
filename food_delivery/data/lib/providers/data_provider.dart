import 'package:core/core.dart';
import 'package:data/data.dart';

part 'data_provider_impl.dart';

abstract class DataProvider {
  factory DataProvider(
    FirebaseFirestore firebaseFirestore,
  ) = _DataProvider;

  Future<List<DishEntity>> getAllDishes();
}

