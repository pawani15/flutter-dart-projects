import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:journal_app/main.dart';

void main() {
  testWidgets('Add a journal entry and open its details',
      (WidgetTester tester) async {
    await tester.pumpWidget(const JournalApp());

    expect(find.text('No journal entries yet'), findsOneWidget);

    await tester.tap(find.text('New Entry'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'First day');
    await tester.enterText(find.byType(TextFormField).last, 'Learned Flutter.');
    await tester.tap(find.text('Save Entry'));
    await tester.pumpAndSettle();

    expect(find.text('No journal entries yet'), findsNothing);
    expect(find.text('First day'), findsOneWidget);

    await tester.tap(find.text('First day'));
    await tester.pumpAndSettle();

    expect(find.text('Entry Details'), findsOneWidget);
    expect(find.text('Learned Flutter.'), findsOneWidget);
  });
}
