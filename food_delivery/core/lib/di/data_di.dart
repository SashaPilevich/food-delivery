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
    _initGoogleSignIn();
    _initDataProvider();
    _initAuthDataProvider();
    _initLocalDataProvider();
    _initDishes();
    _initHive();
    _initAdapter();
    _initSettings();
    _initSettingsPreferencesProvider();
    _initCart();
    _initAuth();
    _initOrders();
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
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
    FirebaseFirestore.instance.clearPersistence();
  }

  Future<void> _initGoogleSignIn() async {
    getIt.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
    );
  }

  void _initAdapter() {
    getIt.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
    getIt.registerLazySingleton<CartDishEntityAdapter>(
      () => CartDishEntityAdapter(),
    );
    getIt.registerLazySingleton<CartEntityAdapter>(
      () => CartEntityAdapter(),
    );
    getIt.registerLazySingleton<UserEntityAdapter>(
      () => UserEntityAdapter(),
    );
    getIt.registerLazySingleton<OrderEntityAdapter>(
      () => OrderEntityAdapter(),
    );
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(
      getIt.get<DishEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<CartDishEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<CartEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<UserEntityAdapter>(),
    );
    Hive.registerAdapter(
      getIt.get<OrderEntityAdapter>(),
    );
  }

  void _initDataProvider() {
    getIt.registerLazySingleton<DataProvider>(
      () => DataProviderImpl(
        FirebaseFirestore.instance,
      ),
    );
    getIt.registerLazySingleton<OrdersDataProvider>(
      () => OrdersDataProviderImpl(
        getIt.get<FirebaseFirestore>(),
      ),
    );
  }

  void _initLocalDataProvider() {
    getIt.registerLazySingleton<LocalDataProvider>(
      () => LocalDataProviderImpl(),
    );
    getIt.registerLazySingleton<CartLocalDataProvider>(
      () => CartLocalDataProvider(),
    );
    getIt.registerLazySingleton<LocalAuthDataProvider>(
      () => LocalAuthDataProviderImpl(),
    );
    getIt.registerLazySingleton<LocalOrdersDataProvider>(
      () => const LocalOrdersDataProviderImpl(),
    );
  }

  void _initAuthDataProvider() {
    getIt.registerLazySingleton<AuthDataProvider>(
      () => AuthDataProviderImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
        googleSignIn: getIt.get<GoogleSignIn>(),
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
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

  void _initCart() {
    getIt.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        cartLocalDataProvider: getIt.get<CartLocalDataProvider>(),
      ),
    );

    getIt.registerLazySingleton<AddCartDishUseCase>(
      () => AddCartDishUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );

    getIt.registerLazySingleton<RemoveCartDishUseCase>(
      () => RemoveCartDishUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );

    getIt.registerLazySingleton<GetCartDishesUseCase>(
      () => GetCartDishesUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );

    getIt.registerLazySingleton<ClearCartUseCase>(
      () => ClearCartUseCase(
        cartRepository: getIt.get<CartRepository>(),
      ),
    );
  }

  void _initOrders() {
    getIt.registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(
        ordersDataProvider: getIt.get<OrdersDataProvider>(),
        localOrdersDataProvider: getIt.get<LocalOrdersDataProvider>(),
      ),
    );
    getIt.registerLazySingleton<AddOrderUseCase>(
      () => AddOrderUseCase(
        ordersRepository: getIt.get<OrdersRepository>(),
      ),
    );
    getIt.registerLazySingleton<FetchOrdersUseCase>(
      () => FetchOrdersUseCase(
        ordersRepository: getIt.get<OrdersRepository>(),
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

  void _initAuth() {
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authDataProvider: getIt.get<AuthDataProvider>(),
        localAuthDataProvider: getIt.get<LocalAuthDataProvider>(),
      ),
    );
    getIt.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );
    getIt.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );
    getIt.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetUserFromStorageUseCase>(
      () => GetUserFromStorageUseCase(
        authRepository: getIt.get<AuthRepository>(),
      ),
    );
  }
}
