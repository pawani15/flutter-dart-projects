import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:creative_app/main.dart';
import 'package:creative_app/providers/habit_provider.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) {
    return tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => HabitProvider(),
        child: const CreativeApp(),
      ),
    );
  }

  testWidgets('Completing a habit updates the progress', (tester) async {
    await pumpApp(tester);

    expect(find.text('0 of 3 habits completed'), findsOneWidget);

    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    expect(find.text('1 of 3 habits completed'), findsOneWidget);
  });

  testWidgets('Habits can be added and deleted', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Add Habit'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Go for a walk');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('Go for a walk'), findsOneWidget);
    expect(find.text('0 of 4 habits completed'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline).last);
    await tester.pump();

    expect(find.text('Go for a walk'), findsNothing);
    expect(find.text('0 of 3 habits completed'), findsOneWidget);
  });
}
