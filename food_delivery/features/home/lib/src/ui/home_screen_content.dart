import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

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
                padding: const EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: screenHeight * 0.4,
                  childAspectRatio: 2 / 2.3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
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
