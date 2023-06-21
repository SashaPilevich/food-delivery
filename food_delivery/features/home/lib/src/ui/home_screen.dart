import 'package:core/core.dart';
import 'package:core/di/data_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/export_usecases.dart';
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
      )..add(
          LoadListOfDishes(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Food Delivery'),
          actions: const <Widget>[
            CustomSwitchTheme(),
          ],
        ),
        body: BlocBuilder<DishesBloc, DishesState>(
          builder: (BuildContext context, DishesState state) {
            if (state is DishesLoadingState) {
              return const LoadingIndicator();
            }
            if (state is DishesErrorState) {
              return Center(
                child: Text(
                    state.exception?.toString() ?? 'Something went wrong...'),
              );
            }
            if (state is DishesLoadedState) {
              return GridView(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
            }
            return Container();
          },
        ),
      ),
    );
  }
}
