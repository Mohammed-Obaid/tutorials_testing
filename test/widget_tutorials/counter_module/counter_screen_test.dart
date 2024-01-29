import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorials_testing/unit_tutorials/counter_module/counter.dart';
import 'package:tutorials_testing/widget_tutorials/counter_module/counter_screen.dart';

void main() {
  //give when then
  testWidgets(
      'give counter is 0 when increament button is clicked then counter should be 1',
      (tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: CounterScreen(title: 'Counter App')));
    expect(find.text('0'), findsOneWidget);
    final counterButton = find.byType(FloatingActionButton);
    await tester.ensureVisible(counterButton);
    await tester.tap(counterButton);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
