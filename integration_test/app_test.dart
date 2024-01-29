import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tutorials_testing/integration_tutorials/home_screen.dart';
import 'package:tutorials_testing/main.dart' as app;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Screen', () {
    testWidgets(
        'give login screen when insert correct account data then open Home Screen ',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), 'password');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
        'verify login screen with incorrect username and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(find.byType(TextFormField).at(0), 'rivaan');
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(find.byType(TextFormField).at(1), 'rivaan123');
          await Future.delayed(const Duration(seconds: 2));
          await tester.tap(find.byType(ElevatedButton));
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();

          await Future.delayed(const Duration(seconds: 2));
          expect(find.text('Invalid username or password'), findsOneWidget);
        },
      );
  });
}
