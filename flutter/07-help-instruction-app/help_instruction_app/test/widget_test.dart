import 'package:flutter_test/flutter_test.dart';

import 'package:help_instruction_app/main.dart';

void main() {
  testWidgets('Open a help topic and see its instructions',
      (WidgetTester tester) async {
    await tester.pumpWidget(const HelpApp());

    expect(find.text('How can we help you?'), findsOneWidget);
    expect(find.text('Getting Started'), findsOneWidget);

    // Expand the topic, then open its details screen.
    await tester.tap(find.text('Getting Started'));
    await tester.pumpAndSettle();

    expect(find.text('• Open the application.'), findsOneWidget);

    await tester.tap(find.text('View Details'));
    await tester.pumpAndSettle();

    expect(find.text('Step-by-step Instructions'), findsOneWidget);
  });
}
