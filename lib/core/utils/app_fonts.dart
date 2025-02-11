import 'package:flutter/material.dart';

import '../theme/theme_service.dart';
import 'scaling_helper.dart';

/// Centralized typography system for the app
class AppFonts {
  // Font families
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'OpenSans';

  // Base sizes
  static const double _baseHeading1 = 24.0;
  static const double _baseHeading2 = 20.0;
  static const double _baseBody = 16.0;
  static const double _baseCaption = 14.0;

  /// Heading 1 style
  static TextStyle heading1(BuildContext context) => TextStyle(
        fontSize: ScalingHelper.responsiveFontSize(context, _baseHeading1),
        fontFamily: primaryFont,
        fontWeight: FontWeight.w700,
        color: ThemeService.onBackgroundColor(context),
        height: 1.2,
      );

  /// Heading 2 style
  static TextStyle heading2(BuildContext context) => TextStyle(
        fontSize: ScalingHelper.responsiveFontSize(context, _baseHeading2),
        fontFamily: primaryFont,
        fontWeight: FontWeight.w600,
        color: ThemeService.onBackgroundColor(context),
        height: 1.3,
      );

  /// Body text style
  static TextStyle body(BuildContext context) => TextStyle(
        fontSize: ScalingHelper.responsiveFontSize(context, _baseBody),
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w400,
        color: ThemeService.onBackgroundColor(context),
        height: 1.5,
      );

  /// Caption text style
  static TextStyle caption(BuildContext context) => TextStyle(
        fontSize: ScalingHelper.responsiveFontSize(context, _baseCaption),
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w500,
        color: ThemeService.onBackgroundColor(context).withOpacity(0.7),
        letterSpacing: 0.5,
      );

  /// Button text style
  static TextStyle buttonText(BuildContext context) => TextStyle(
        fontSize: ScalingHelper.responsiveFontSize(context, _baseBody),
        fontFamily: primaryFont,
        fontWeight: FontWeight.w600,
        color: ThemeService.onPrimaryColor(context),
      );
}
