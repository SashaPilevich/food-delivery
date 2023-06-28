import 'package:core/di/app_navigation_di.dart';
import 'package:core/di/data_di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/delivery_food_app.dart';

import 'generated/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  navigationDI.initDependencies();
  await getIt.allReady();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pl','PL'),
      ],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en', 'US'),
      child: const DeliveryFoodApp(),
    ),
  );
}
