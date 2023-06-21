import 'package:core/core.dart';
import 'package:core/di/data_di.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/delivery_food_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dataDI.initDependencies();
  final app = await Firebase.initializeApp(
    options: getIt.get<FirebaseOptions>(),
  );
  print(app.options.projectId);
  runApp(const DeliveryFoodApp());
}

