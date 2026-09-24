import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/home.dart';

void main() {
  testWidgets('Profile screen renders desktop layout', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const HomePage());
    await tester.pump(const Duration(milliseconds: 800));

    expect(find.text('View Projects'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Featured Projects'),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Featured Projects'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text("Let's Connect"),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text("Let's Connect"), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 300));
  });
}