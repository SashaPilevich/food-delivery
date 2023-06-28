import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/dishes/bloc.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isPortrait = orientation == Orientation.portrait;
    return BlocProvider<DishesBloc>(
      create: (context) => DishesBloc(
        fetchAllDishesUseCase: getIt.get<FetchAllDishesUseCase>(),
      ),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<DishesBloc, DishesState>(
            builder: (BuildContext context, DishesState state) {
              if (state.exception != null) {
                return Center(
                  child: Text(
                      state.exception?.toString() ?? 'Something went wrong...'),
                );
              }
              if (state.listOfDishes.isNotEmpty) {
                return GridView(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent:
                        isPortrait ? screenHeight * 0.4 : screenHeight * 0.5,
                    childAspectRatio: isPortrait ? 2 / 2.3 : 2.4 / 2.8,
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
      ),
    );
  }
}
