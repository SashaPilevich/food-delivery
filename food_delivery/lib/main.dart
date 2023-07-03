import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/delivery_food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  appDI.initDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pl', 'PL'),
      ],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en', 'US'),
      child: const DeliveryFoodApp(),
    ),
  );
}
