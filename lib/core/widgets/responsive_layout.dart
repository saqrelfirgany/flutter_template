import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Responsive layout wrapper
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (ResponsiveBreakpoints.of(context).largerThan(DESKTOP)) {
            return desktop ?? tablet ?? mobile;
          } else if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) {
            return tablet ?? mobile;
          } else {
            return mobile;
          }
        },
      ),
      breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 1200, name: TABLET),
        const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
      ],
    );
  }
}
