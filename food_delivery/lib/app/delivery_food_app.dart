import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:settings/settings.dart';

class DeliveryFoodApp extends StatelessWidget {
  const DeliveryFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(
            checkThemeModeUseCase: getIt.get<CheckThemeModeUseCase>(),
            checkThemeTypeUseCase: getIt.get<CheckThemeTypeUseCase>(),
            setThemeModeUseCase: getIt.get<SetThemeModeUseCase>(),
            setThemeTypeUseCase: getIt.get<SetThemeTypeUseCase>(),
          ),
        ),
        BlocProvider<FontSizeBloc>(
          create: (_) => FontSizeBloc(
            checkFontSizeUseCase: getIt.get<CheckFontSizeUseCase>(),
            setFontSizeUseCase: getIt.get<SetFontSizeUseCase>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp.router(
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);

              return BlocBuilder<FontSizeBloc, FontSizeState>(
                builder: (_, FontSizeState state) {
                  return MediaQuery(
                    data: mediaQueryData.copyWith(
                      textScaleFactor: state.textScale,
                    ),
                    child: child!,
                  );
                },
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
