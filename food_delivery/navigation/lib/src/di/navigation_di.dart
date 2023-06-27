import 'package:core/di/data_di.dart';
import 'package:navigation/navigation.dart';

void setupNavigationDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
