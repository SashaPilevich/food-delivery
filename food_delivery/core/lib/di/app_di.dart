import 'package:core/di/data_di.dart';
import 'package:navigation/navigation.dart';

final AppDI appDI = AppDI();

class AppDI {
  void initDependencies() {
    _setupNavigationDependencies();
  }

  void _setupNavigationDependencies() {
    getIt.registerSingleton<AppRouter>(
      AppRouter(),
    );
  }
}
