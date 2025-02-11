import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Utility for responsive scaling
class ScalingHelper {
  static const double _baseMobileWidth = 360.0;
  static const double _baseTabletWidth = 768.0;
  static const double _baseDesktopWidth = 1440.0;

  /// Calculates the scaling factor based on screen width
  static double scaleFactor(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    double baseWidth = _baseMobileWidth;
    if (breakpoint.isTablet) baseWidth = _baseTabletWidth;
    if (breakpoint.isDesktop) baseWidth = _baseDesktopWidth;

    final ratio = screenWidth / baseWidth;
    final scale = pow(ratio, 0.3).clamp(0.8, 1.5).toDouble();

    return scale * MediaQuery.textScaleFactorOf(context);
  }

  /// Responsive font size calculation
  static double responsiveFontSize(BuildContext context, double baseSize) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    double multiplier = 1.0;

    if (breakpoint.isTablet) multiplier = 1.2;
    if (breakpoint.isDesktop) multiplier = 1.4;

    return (baseSize * multiplier) * scaleFactor(context);
  }

  /// Responsive padding calculation
  static EdgeInsets responsivePadding(BuildContext context) {
    final base = responsiveFontSize(context, 8);
    return EdgeInsets.all(base * 2);
  }
}
