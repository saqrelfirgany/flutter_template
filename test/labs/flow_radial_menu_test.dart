import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../labs/flow-radial-menu/flow_radial_menu_demo.dart';

void main() {
  testWidgets(
    'Flow radial menu fans its action buttons away from the toggle on tap',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: FlowRadialMenuDemo()),
        ),
      );

      final toggleFinder = find.byKey(const Key('radial-toggle'));
      final shareFinder = find.byIcon(Icons.share);

      expect(toggleFinder, findsOneWidget);
      expect(shareFinder, findsOneWidget);

      final collapsedCenter = tester.getCenter(shareFinder);

      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      final expandedCenter = tester.getCenter(shareFinder);
      final distanceMoved = (expandedCenter - collapsedCenter).distance;

      expect(distanceMoved, greaterThan(50));

      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      final closedCenter = tester.getCenter(shareFinder);
      expect((closedCenter - collapsedCenter).distance, lessThan(1));
    },
  );
}
