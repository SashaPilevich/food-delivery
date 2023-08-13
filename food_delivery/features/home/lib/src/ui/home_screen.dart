import 'package:animations/animations.dart';
import 'package:auth/auth.dart';
import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:home/home.dart';
import 'package:home/src/ui/widgets/home_screen_header.dart';
import 'widgets/custom_tabs.dart';
import 'widgets/dish_element.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);
    final DishesBloc bloc = BlocProvider.of<DishesBloc>(context);
    final AuthBloc authBloc = BlocProvider.of(context);
    final CartBloc cartBloc = BlocProvider.of(context);
    cartBloc.add(InitCart());
    

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: AppPadding.padding10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      authBloc.add(SignOutSubmitted());
                      authBloc.add(
                        NavigateToSignInScreen(),
                      );
                    },
                    icon: Icon(
                      Icons.logout,
                      color: themeData.primaryColor,
                    ),
                  ),
                ),
              ],
              backgroundColor: AppColors.transparent,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.padding10,
                ),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (_, AuthState state) {
                    if (state.userModel.userName != '') {
                      final String userName = state.userModel.userName;
                      return Text(
                        '${'homeScreen.hello'.tr()}, $userName!',
                        style: themeData.textTheme.titleLarge,
                      );
                    } else {
                      return Text(
                        'homePage.foodDelivery'.tr(),
                      );
                    }
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeScreenHeader(),
            ),
            const SliverToBoxAdapter(
              child: CustomTabs(),
            )
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async {
            bloc.add(LoadListOfDishes());
          },
          child: BlocConsumer<DishesBloc, DishesState>(
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
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(
                          AppPadding.padding15,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: mediaQueryData.size.height * 0.4,
                          childAspectRatio: 2 / 2.45,
                          crossAxisSpacing: AppSpacing.spacing20,
                          mainAxisSpacing: AppSpacing.spacing20,
                        ),
                        itemCount: state.dishesOfSelectedCategory.isEmpty
                            ? state.listOfDishes.length
                            : state.dishesOfSelectedCategory.length,
                        itemBuilder: (_, int index) {
                          return OpenContainer(
                            closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSize.size20,
                              ),
                            ),
                            transitionDuration: const Duration(
                              milliseconds: 500,
                            ),
                            transitionType: ContainerTransitionType.fadeThrough,
                            openBuilder: (_, VoidCallback action) {
                              return SelectDishScreen(
                                dish: state.dishesOfSelectedCategory.isEmpty
                                    ? state.listOfDishes[index]
                                    : state.dishesOfSelectedCategory[index],
                              );
                            },
                            closedBuilder: (_, VoidCallback action) {
                              return DishElement(
                                dish: state.dishesOfSelectedCategory.isEmpty
                                    ? state.listOfDishes[index]
                                    : state.dishesOfSelectedCategory[index],
                                onTap: action,
                              );
                            },
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
