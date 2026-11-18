import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:animation_app/main.dart';

void main() {
  testWidgets('Open the opacity screen and hide the box',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AnimationApp());

    expect(find.text('Animation Gallery'), findsOneWidget);

    await tester.tap(find.text('Animated Opacity'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Hide'));
    await tester.pumpAndSettle();

    expect(find.text('Show'), findsOneWidget);
    final opacity = tester.widget<AnimatedOpacity>(
      find.byType(AnimatedOpacity),
    );
    expect(opacity.opacity, 0);
  });

  testWidgets('Animation controller starts and stops', (tester) async {
    await tester.pumpWidget(const AnimationApp());

    await tester.tap(find.text('Animation Controller'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Start / Stop Animation'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.hasRunningAnimations, isTrue);

    await tester.tap(find.text('Start / Stop Animation'));
    // Settles only if the repeating animation was really stopped.
    await tester.pumpAndSettle();
    expect(tester.hasRunningAnimations, isFalse);
  });
}
