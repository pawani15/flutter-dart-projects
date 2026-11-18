import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:responsive_app/main.dart';

void main() {
  Future<int> columnsAtWidth(WidgetTester tester, double width) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(width, 900);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const ResponsiveApp());
    await tester.pumpAndSettle();

    final grid = tester.widget<GridView>(find.byType(GridView));
    final delegate =
        grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
    return delegate.crossAxisCount;
  }

  testWidgets('Mobile width shows a single column', (tester) async {
    expect(await columnsAtWidth(tester, 400), 1);
    expect(find.text('Welcome!'), findsOneWidget);
  });

  testWidgets('Tablet width shows two columns', (tester) async {
    expect(await columnsAtWidth(tester, 800), 2);
    expect(find.text('Welcome to Your Dashboard'), findsOneWidget);
  });

  testWidgets('Desktop width shows three columns', (tester) async {
    expect(await columnsAtWidth(tester, 1400), 3);
    expect(find.text('Welcome to Your Dashboard'), findsOneWidget);
  });
}
