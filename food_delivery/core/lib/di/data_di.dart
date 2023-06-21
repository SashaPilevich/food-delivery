import 'package:core/core.dart';
import 'package:data/providers/data_provider.dart';
import 'package:data/repositories/dishes_repository_impl.dart';
import 'package:domain/repositories/dishes_repository.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebaseOptions();
    _initDataProvider();
    _initDishes();
  }

  void _initFirebaseOptions() {
    getIt.registerLazySingleton<FirebaseOptions>(
        () => DefaultFirebaseOptions.currentPlatform);
  }

  void _initDataProvider() {
    getIt.registerLazySingleton<DataProvider>(
      () => DataProvider(FirebaseFirestore.instance),
    );
  }

  void _initDishes() {
    getIt.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        dataProvider: getIt.get<DataProvider>(),
      ),
    );

    getIt.registerLazySingleton<FetchAllDishesUseCase>(
      () => FetchAllDishesUseCase(
        dishesRepository: getIt.get<DishesRepository>(),
      ),
    );
  }
}
