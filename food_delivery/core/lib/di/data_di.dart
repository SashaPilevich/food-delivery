import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebaseOptions();
    _initFirebase();
    _initDataProvider();
    _initDishes();
  }

  void _initFirebaseOptions() {
    getIt.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initFirebase() {
    getIt.registerSingletonAsync<FirebaseApp>(() async {
      final FirebaseOptions options = getIt.get<FirebaseOptions>();
      return Firebase.initializeApp(
        options: options,
      );
    });
  }

  void _initDataProvider() {
    getIt.registerLazySingleton<DataProvider>(
      () => DataProviderImpl(
        FirebaseFirestore.instance,
      ),
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
