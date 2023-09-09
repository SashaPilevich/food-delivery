import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart';

final List<DishModel> dishesFromService = [
  DishModel(
    id: '1',
    title: 'Pizza',
    imageUrl: 'image.png',
    cost: 10,
    category: 'Italian',
  ),
  DishModel(
    id: '2',
    title: 'Cheeseburger',
    imageUrl: 'image.png',
    cost: 12,
    category: 'Fast food',
  ),
  DishModel(
    id: '3',
    title: 'Cheesecake',
    imageUrl: 'image.png',
    cost: 14,
    category: 'Deserts',
  ),
  DishModel(
    id: '4',
    title: 'Carbonara',
    imageUrl: 'image.png',
    cost: 10,
    category: 'Italian',
  ),
];
final List<DishModel> dishesFromServiceEmpty = [];
void main() {
  late DishesBloc dishesBloc;
  late MockFetchAllDishesUseCase mockFetchAllDishesUseCase;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockFetchAllDishesUseCase = MockFetchAllDishesUseCase();
    dishesBloc = DishesBloc(
      fetchAllDishesUseCase: mockFetchAllDishesUseCase,
    );
    when(
      () => mockFetchAllDishesUseCase.execute(
        const NoParams(),
      ),
    ).thenAnswer(
      (_) async => Future.value(
        <DishModel>[],
      ),
    );
  });

  group('DishesBloc', () {
    void arrangeFetchAllDishesReturnsThreeDishes() async {
      when(
        () => mockFetchAllDishesUseCase.execute(
          const NoParams(),
        ),
      ).thenAnswer((_) async => dishesFromService);
    }

    void arrangeFetchAllDishesReturnsEmptyListOfDishes() async {
      when(
        () => mockFetchAllDishesUseCase.execute(
          const NoParams(),
        ),
      ).thenAnswer((_) async => dishesFromServiceEmpty);
    }

    test('initial state', () async {
      expect(dishesBloc.state.listOfDishes, []);
      expect(dishesBloc.state.categories, []);
      expect(dishesBloc.state.isLoading, true);
      expect(dishesBloc.state.exception, null);
    });

    test('init list of dishes - empty list', () async {
      arrangeFetchAllDishesReturnsEmptyListOfDishes();
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishesFromServiceEmpty,
        ),
      );
      expect(dishesBloc.state.listOfDishes, dishesFromServiceEmpty);
      verify(
        () => mockFetchAllDishesUseCase.execute(
          const NoParams(),
        ),
      ).called(1);
    });

    test('load list of dishes', () async {
      arrangeFetchAllDishesReturnsThreeDishes();
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishesFromService,
        ),
      );
      expect(dishesBloc.state.listOfDishes, dishesFromService);
      verify(
        () => mockFetchAllDishesUseCase.execute(
          const NoParams(),
        ),
      ).called(1);
    });

    test('filter dishes by category - All', () async {
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishesFromService,
        ),
      );
      dishesBloc.add(
        FilterDishesByCategory(
          category: Category.All.getStringValue(),
        ),
      );
      expect(dishesBloc.state.dishesOfSelectedCategory, []);
      expect(dishesBloc.state.listOfDishes, dishesFromService);
    });

    test('filter dishes by category - specific category', () async {
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          listOfDishes: dishesFromService,
        ),
      );
      dishesBloc.add(
        FilterDishesByCategory(category: 'Italian'),
      );
      final List<DishModel> selectedDishes = dishesFromService
          .where((dish) => dish.category == 'Italian')
          .toList();
      dishesBloc.emit(
        dishesBloc.state.copyWith(
          dishesOfSelectedCategory: selectedDishes,
        ),
      );
      expect(dishesBloc.state.dishesOfSelectedCategory, selectedDishes);
      expect(dishesBloc.state.dishesOfSelectedCategory.length, 2);
    });
  });
}
