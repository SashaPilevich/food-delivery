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
    _initThemePreferencesProvider();
    _initTheme();
    _initFontSizePreferencesProvider();
    _initFontSize();
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

  void _initThemePreferencesProvider() {
    getIt.registerLazySingleton<ThemePreferencesProvider>(
      () => ThemePreferencesProviderImpl(),
    );
  }

  void _initTheme() {
    getIt.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(
        themePreferencesProvider: getIt.get<ThemePreferencesProvider>(),
      ),
    );
    getIt.registerLazySingleton<CheckThemeModeUseCase>(
      () => CheckThemeModeUseCase(
        themeRepository: getIt.get<ThemeRepository>(),
      ),
    );
    getIt.registerLazySingleton<CheckThemeTypeUseCase>(
      () => CheckThemeTypeUseCase(
        themeRepository: getIt.get<ThemeRepository>(),
      ),
    );
    getIt.registerLazySingleton<SetThemeModeUseCase>(
      () => SetThemeModeUseCase(
        themeRepository: getIt.get<ThemeRepository>(),
      ),
    );
    getIt.registerLazySingleton<SetThemeTypeUseCase>(
      () => SetThemeTypeUseCase(
        themeRepository: getIt.get<ThemeRepository>(),
      ),
    );
  }

  void _initFontSizePreferencesProvider() {
    getIt.registerLazySingleton<FontSizePreferencesProvider>(
      () => FontSizePreferencesProviderImpl(),
    );
  }

  void _initFontSize() {
    getIt.registerLazySingleton<FontSizeRepository>(
      () => FontSizeRepositoryImpl(
        fontSizePreferencesProvider: getIt.get<FontSizePreferencesProvider>(),
      ),
    );
    getIt.registerLazySingleton<CheckFontSizeUseCase>(
      () => CheckFontSizeUseCase(
        fontSizeRepository: getIt.get<FontSizeRepository>(),
      ),
    );
    getIt.registerLazySingleton<SetFontSizeUseCase>(
      () => SetFontSizeUseCase(
        fontSizeRepository: getIt.get<FontSizeRepository>(),
      ),
    );
  }
}
