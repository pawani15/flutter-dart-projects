import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dice_app/main.dart';

void main() {
  testWidgets('Dice is shown and can be rolled', (WidgetTester tester) async {
    await tester.pumpWidget(const DiceApp());

    expect(find.byType(DiceFace), findsOneWidget);

    await tester.tap(find.byIcon(Icons.casino));
    await tester.pumpAndSettle();

    expect(find.byType(DiceFace), findsOneWidget);
  });
}
