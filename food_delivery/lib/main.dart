import 'package:core/di/data_di.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/delivery_food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  await getIt.allReady();
  runApp(const DeliveryFoodApp());
}
