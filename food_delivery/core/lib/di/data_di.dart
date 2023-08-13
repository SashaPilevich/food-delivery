import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebase();
    _initGoogleSignIn();
    _initHiveProvider();
    _initDataProvider();
    _initAuthDataProvider();
    _initDishes();
    _initHive();
    _initAdapter();
    _initSettings();
    _initCart();
    _initAuth();
    _initOrders();
  }

  Future<void> _initFirebase() async {
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
    getIt.registerLazySingleton<FirebaseFirestoreDataProvider>(
      () => FirebaseFirestoreDataProviderImpl(
        firebaseFirestore: getIt.get<FirebaseFirestore>(),
      ),
    );
  }

  void _initHiveProvider() {
    getIt.registerLazySingleton<HiveProvider>(
      () => HiveProviderImpl(),
    );
  }

  void _initAuthDataProvider() {
    getIt.registerLazySingleton<FirebaseAuthProvider>(
      () => FirebaseAuthProviderImpl(
        firebaseAuth: getIt.get<FirebaseAuth>(),
        googleSignIn: getIt.get<GoogleSignIn>(),
        firebaseFirestoreDataProvider:
            getIt.get<FirebaseFirestoreDataProvider>(),
        hiveProvider: getIt.get<HiveProvider>(),
      ),
    );
  }

  void _initDishes() {
    getIt.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
        firebaseFirestoreDataProvider:
            getIt.get<FirebaseFirestoreDataProvider>(),
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
        hiveProvider: getIt.get<HiveProvider>(),
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
    getIt.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
        firebaseFirestoreDataProvider:
            getIt.get<FirebaseFirestoreDataProvider>(),
      ),
    );
    getIt.registerLazySingleton<AddOrderUseCase>(
      () => AddOrderUseCase(
        orderRepository: getIt.get<OrderRepository>(),
      ),
    );
    getIt.registerLazySingleton<FetchOrdersUseCase>(
      () => FetchOrdersUseCase(
        orderRepository: getIt.get<OrderRepository>(),
      ),
    );
  }

  void _initSettings() {
    getIt.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        hiveProvider: getIt.get<HiveProvider>(),
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
        hiveProvider: getIt.get<HiveProvider>(),
        firebaseAuthProvider: getIt.get<FirebaseAuthProvider>(),
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
