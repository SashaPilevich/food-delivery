import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final ThemeData themeData = Theme.of(context);
    final DishesBloc bloc = BlocProvider.of<DishesBloc>(context);
    int selectedTab = 0;

    return BlocBuilder<DishesBloc, DishesState>(
      builder: (_, DishesState state) {
        return Container(
          padding: const EdgeInsets.only(
            left: AppPadding.padding10,
            top: AppPadding.padding10,
          ),
          child: DefaultTabController(
            length: state.categories.length,
            child: TabBar(
              indicator: const BoxDecoration(),
              onTap: (int value) {
                selectedTab = value;
                bloc.add(
                  FilterDishesByCategory(
                    category: state.categories[value],
                  ),
                );
              },
              isScrollable: true,
              tabs: <Widget>[
                ...List.generate(
                  state.categories.length,
                  (int index) => Tab(
                    child: AnimatedContainer(
                      width: mediaQueryData.size.width * 0.2,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      curve: Curves.linear,
                      padding: const EdgeInsets.all(
                        AppPadding.padding10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppSize.size20,
                          ),
                          color: selectedTab == index
                              ? themeData.primaryColor
                              : AppColors.white),
                      child: Text(
                        state.categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: selectedTab == index
                                ? AppColors.white
                                : themeData.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
