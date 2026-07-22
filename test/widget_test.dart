import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_template/core/widgets/responsive_layout.dart';

void main() {
  testWidgets(
    'ResponsiveLayout falls back to the mobile child when no '
    'tablet or desktop child is provided',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ResponsiveLayout(
            mobile: Text('Mobile Layout'),
          ),
        ),
      );

      expect(find.text('Mobile Layout'), findsOneWidget);
    },
  );
}
