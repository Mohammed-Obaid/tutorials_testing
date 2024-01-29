import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorials_testing/widget_tutorials/user_module/models/user_model.dart';
import 'package:tutorials_testing/widget_tutorials/user_module/views/user_screeen.dart';

void main() {
  testWidgets(
    'Displays List of users with title as name and  subtitle as email',
    (tester) async {
      final users = [
        User(id: 1, name: 'Rivaan', email: 'rivaan@gmail.com'),
        User(id: 2, name: 'Naman', email: 'naman@gmail.com'),
      ];

      Future<List<User>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
          () => users,
        );
      }

      await tester.pumpWidget(
        MaterialApp(
          home: UserScreen(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}