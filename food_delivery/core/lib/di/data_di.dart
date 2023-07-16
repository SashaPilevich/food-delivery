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
    _initLocalDataProvider();
    _initDishes();
    _initHive();
    _initAdapter();
  }

  void _initFirebaseOptions() {
    getIt.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initFirebase() async {
    await Firebase.initializeApp(
      options: getIt<FirebaseOptions>(),
    );
    FirebaseFirestore.instance.clearPersistence();
  }

  void _initAdapter() async {
    getIt.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
  }

  void _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      getIt.get<DishEntityAdapter>(),
    );
  }

  void _initDataProvider() {
    getIt.registerLazySingleton<DataProvider>(
      () => DataProviderImpl(
        FirebaseFirestore.instance,
      ),
    );
  }

  void _initLocalDataProvider() {
    getIt.registerLazySingleton<LocalDataProvider>(
      () => LocalDataProviderImpl(),
    );
  }

  void _initDishes() {
    getIt.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        dataProvider: getIt.get<DataProvider>(),
        localDataProvider: getIt.get<LocalDataProvider>(),
      ),
    );

    getIt.registerLazySingleton<FetchAllDishesUseCase>(
      () => FetchAllDishesUseCase(
        dishesRepository: getIt.get<DishesRepository>(),
      ),
    );
  }
}
