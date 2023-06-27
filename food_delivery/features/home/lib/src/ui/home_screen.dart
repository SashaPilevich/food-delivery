import 'package:core/core.dart';
import 'package:core/di/data_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/dishes/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2.3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: <Widget>[
                      ...List.generate(
                        state.listOfDishes.length,
                        (index) => DishElement(
                          dish: state.listOfDishes[index],
                          onTap: () {},
                        ),
                      ),
                    ]);
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
