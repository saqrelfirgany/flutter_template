import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

/// Service for managing app themes
class ThemeService {
  /// Toggles between light and dark mode
  static void toggleTheme(BuildContext context) =>
      AdaptiveTheme.of(context).toggleThemeMode();

  /// Checks if dark mode is enabled
  static bool isDarkMode(BuildContext context) =>
      AdaptiveTheme.of(context).mode.isDark;

  /// Returns the current color scheme
  static ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  /// Primary color getter
  static Color primaryColor(BuildContext context) =>
      colorScheme(context).primary;

  /// Secondary color getter
  static Color secondaryColor(BuildContext context) =>
      colorScheme(context).secondary;

  /// Background color getter
  static Color backgroundColor(BuildContext context) =>
      colorScheme(context).background;

  /// Surface color getter
  static Color surfaceColor(BuildContext context) =>
      colorScheme(context).surface;

  /// Error color getter
  static Color errorColor(BuildContext context) => colorScheme(context).error;

  /// Text color on primary
  static Color onPrimaryColor(BuildContext context) =>
      colorScheme(context).onPrimary;

  /// Text color on secondary
  static Color onSecondaryColor(BuildContext context) =>
      colorScheme(context).onSecondary;

  /// Text color on background
  static Color onBackgroundColor(BuildContext context) =>
      colorScheme(context).onBackground;

  /// Text color on surface
  static Color onSurfaceColor(BuildContext context) =>
      colorScheme(context).onSurface;

  /// Text color on error
  static Color onErrorColor(BuildContext context) =>
      colorScheme(context).onError;
}
