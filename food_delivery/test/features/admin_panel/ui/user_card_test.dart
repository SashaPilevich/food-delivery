import 'package:admin_panel/admin_panel.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const UserModel userModel = UserModel(
  uid: '1',
  role: 'user',
  userName: 'sasha',
  email: 'sasha@gmail.com',
);
void main() {
  testWidgets('UserCard displays correct user information',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: UserCard(
          userModel: userModel,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('sasha'), findsOneWidget);
    expect(find.text('sasha@gmail.com'), findsOneWidget);
  });

  testWidgets('UserCard calls onPressed callback when button is pressed',
      (WidgetTester tester) async {
    bool onPressedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: UserCard(
          userModel: userModel,
          onPressed: () {
            onPressedCalled = true;
          },
        ),
      ),
    );

    await tester.tap(
      find.byIcon(Icons.verified_user_outlined),
    );
    await tester.pump();
    expect(onPressedCalled, true);
  });
}
