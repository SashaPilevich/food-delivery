import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';
import 'widgets/custom_tabs.dart';
import 'widgets/dish_element.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);
    final DishesBloc bloc = BlocProvider.of<DishesBloc>(context);

    return RefreshIndicator(
      onRefresh: () async {
        bloc.add(LoadListOfDishes());
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<DishesBloc, DishesState>(
            listener: (BuildContext context, DishesState state) {
              if (state.hasInternetConnection!) {
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  messageText: Text(
                    'homeScreen.hasInternet'.tr(),
                    style: themeData.textTheme.titleSmall,
                  ),
                  icon: const Icon(
                    Icons.done,
                    color: AppColors.green,
                  ),
                  duration: const Duration(seconds: 3),
                  padding: const EdgeInsets.all(
                    AppPadding.padding20,
                  ),
                ).show(context);
              } else {
                Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  messageText: Text(
                    'homeScreen.noInternet'.tr(),
                    style: themeData.textTheme.titleSmall,
                  ),
                  icon: const Icon(
                    Icons.error,
                    color: AppColors.red,
                  ),
                  duration: const Duration(seconds: 3),
                  padding: const EdgeInsets.all(
                    AppPadding.padding10,
                  ),
                ).show(context);
              }
            },
            listenWhen: (DishesState previous, DishesState current) {
              return current.hasInternetConnection !=
                  previous.hasInternetConnection;
            },
            builder: (_, DishesState state) {
              if (state.exception != null) {
                return Center(
                  child: Text(
                    state.exception?.toString() ?? 'Something went wrong...',
                  ),
                );
              }
              if (state.listOfDishes.isNotEmpty) {
                return Column(
                  children: <Widget>[
                    const CustomTabs(),
                    Expanded(
                      child: GridView(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(
                          AppPadding.padding15,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: mediaQueryData.size.height * 0.4,
                          childAspectRatio: 2 / 2.5,
                          crossAxisSpacing: AppSpacing.spacing20,
                          mainAxisSpacing: AppSpacing.spacing20,
                        ),
                        children: <Widget>[
                          ...List.generate(
                            state.dishesOfSelectedCategory.isEmpty
                                ? state.listOfDishes.length
                                : state.dishesOfSelectedCategory.length,
                            (index) => DishElement(
                              dish: state.dishesOfSelectedCategory.isEmpty
                                  ? state.listOfDishes[index]
                                  : state.dishesOfSelectedCategory[index],
                              onTap: () {
                                context.navigateTo(
                                  SelectDishScreenRoute(
                                    dish: state.dishesOfSelectedCategory.isEmpty
                                        ? state.listOfDishes[index]
                                        : state.dishesOfSelectedCategory[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
