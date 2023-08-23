import 'package:bloc_test/bloc_test.dart';
import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

void main() {
  late MockCartBloc mockCartBloc;

  setUp(() {
    mockCartBloc = MockCartBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<CartBloc>(
      create: (context) => mockCartBloc,
      child: MaterialApp(
        home: Material(
          child: Scaffold(
            body: body,
          ),
        ),
      ),
    );
  }

  final CartDish cartDish = CartDish(
    dish: DishModel(
      id: '1',
      title: 'Pizza',
      imageUrl: 'image.png',
      cost: 10,
    ),
    quantity: 2,
  );
  testWidgets('check if display right title of dish',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      makeTestableWidget(CartElement(
        cartElement: cartDish,
      )),
    );
    expect(find.text('Pizza'), findsOneWidget);
  });

  testWidgets('displays correct dish cost', (WidgetTester tester) async {
    await tester.pumpWidget(
      makeTestableWidget(CartElement(
        cartElement: cartDish,
      )),
    );

    expect(find.text('\$20'), findsOneWidget);
  });
}
