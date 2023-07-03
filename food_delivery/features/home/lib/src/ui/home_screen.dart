import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/dishes/home_bloc.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DishesBloc, DishesState>(
          builder: (_, DishesState state) {
            if (state.exception != null) {
              return Center(
                child: Text(
                  state.exception?.toString() ?? 'Something went wrong...',
                ),
              );
            }
            if (state.listOfDishes.isNotEmpty) {
              return GridView(
                padding: const EdgeInsets.all(AppPadding.padding_15),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: mediaQueryData.size.height * 0.4,
                  childAspectRatio: 2 / 2.5,
                  crossAxisSpacing: AppSpacing.spacing_20,
                  mainAxisSpacing: AppSpacing.spacing_20,
                ),
                children: <Widget>[
                  ...List.generate(
                    state.listOfDishes.length,
                    (index) => DishElement(
                      dish: state.listOfDishes[index],
                      onTap: () {
                        context.navigateTo(
                          SelectDishScreenRoute(
                            dish: state.listOfDishes[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
