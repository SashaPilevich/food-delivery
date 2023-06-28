import 'package:core/core.dart';
import 'package:core/di/data_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

class DeliveryFoodApp extends StatelessWidget {
  const DeliveryFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeChangedState>(
        builder: (BuildContext context, ThemeChangedState state) {
          return MaterialApp.router(
            routerDelegate: getIt.get<AppRouter>().delegate(),
            routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
            title: 'Food Delivery',
            theme: state.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
