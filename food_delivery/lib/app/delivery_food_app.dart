import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';

class DeliveryFoodApp extends StatelessWidget {
  const DeliveryFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(
        checkThemeModeUseCase: getIt.get<CheckThemeModeUseCase>(),
        checkThemeTypeUseCase: getIt.get<CheckThemeTypeUseCase>(),
        setThemeModeUseCase: getIt.get<SetThemeModeUseCase>(),
        setThemeTypeUseCase: getIt.get<SetThemeTypeUseCase>(),
        checkFontSizeUseCase: getIt.get<CheckFontSizeUseCase>(),
        setFontSizeUseCase: getIt.get<SetFontSizeUseCase>(),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          return MaterialApp.router(
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData mediaQueryData = MediaQuery.of(context);

              return MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaleFactor: state.textScale,
                ),
                child: child!,
              );
            },
            routerDelegate: getIt.get<AppRouter>().delegate(),
            routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
            title: 'Food Delivery',
            theme: state.isSystemTheme ? ThemeData.light() : state.themeData,
            darkTheme: state.isSystemTheme ? ThemeData.dark() : state.themeData,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
