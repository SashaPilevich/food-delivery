import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class DeliveryFoodApp extends StatelessWidget {
  const DeliveryFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp(
            title: 'Food Delivery',
            theme: state is ThemeChangedState && state.isDark
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
