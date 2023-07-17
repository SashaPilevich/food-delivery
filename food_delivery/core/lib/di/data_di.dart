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
    _initSettings();
    _initSettingsPreferencesProvider();
  }

  void _initFirebaseOptions() {
    getIt.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: getIt<FirebaseOptions>(),
    );
    FirebaseFirestore.instance.clearPersistence();
  }

  void _initAdapter() {
    getIt.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
  }

  Future<void> _initHive() async {
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

  void _initSettingsPreferencesProvider() {
    getIt.registerLazySingleton<SettingsPreferencesProvider>(
      () => SettingsPreferencesProvider(),
    );
  }

  void _initSettings() {
    getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        settingsPreferencesProvider: getIt.get<SettingsPreferencesProvider>(),
      ),
    );
    getIt.registerLazySingleton<CheckThemeModeUseCase>(
      () => CheckThemeModeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
    getIt.registerLazySingleton<CheckThemeTypeUseCase>(
      () => CheckThemeTypeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
    getIt.registerLazySingleton<SetThemeModeUseCase>(
      () => SetThemeModeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
    getIt.registerLazySingleton<SetThemeTypeUseCase>(
      () => SetThemeTypeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
    getIt.registerLazySingleton<CheckFontSizeUseCase>(
      () => CheckFontSizeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
    getIt.registerLazySingleton<SetFontSizeUseCase>(
      () => SetFontSizeUseCase(
        settingsRepository: getIt.get<SettingsRepository>(),
      ),
    );
  }
}
