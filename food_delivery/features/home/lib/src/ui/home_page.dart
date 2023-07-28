import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc bloc = BlocProvider.of(context);
    final ThemeData themeData = Theme.of(context);

    return BlocProvider<DishesBloc>(
      create: (_) => DishesBloc(
        fetchAllDishesUseCase: getIt.get<FetchAllDishesUseCase>(),
      ),
      child: AutoTabsScaffold(
        routes: const <PageRouteInfo<dynamic>>[
          HomeScreenRoute(),
          CartScreenRoute(),
          OrderHistoryScreenRoute(),
          SettingsScreenRoute(),
        ],
        appBarBuilder: (_, TabsRouter tabsRouter) {
          return AppBar(
            title: Text(
              'homePage.foodDelivery'.tr(),
            ),
            actions: <Widget>[
              BlocBuilder<AuthBloc, AuthState>(builder: (_, AuthState state) {
                if (state.userModel.userName != '') {
                  final String userName = state.userModel.userName;
                  return Padding(
                    padding: const EdgeInsets.all(
                      AppPadding.padding15,
                    ),
                    child: Text(
                      userName,
                      style: themeData.textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              IconButton(
                onPressed: () {
                  bloc.add(SignOutSubmitted());
                  bloc.add(
                    NavigateToSignInScreen(),
                  );
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          );
        },
        bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
          return CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          );
        },
      ),
    );
  }
}
