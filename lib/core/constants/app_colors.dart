import 'package:flutter/material.dart';

/// App-wide color constants for light and dark themes
class AppColors {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF238b45); // Main green color
  static const Color lightSecondary = Color(0xFF2c7da0); // Accent blue color
  static const Color lightBackground = Color(0xFFf8f9fa); // Light background
  static const Color lightSurface = Color(0xFFFFFFFF); // Cards/surface color
  static const Color lightError = Color(0xFFe63946); // Error color
  static const Color lightOnPrimary = Color(0xFFFFFFFF); // Text on primary
  static const Color lightOnSecondary = Color(0xFFFFFFFF); // Text on secondary
  static const Color lightOnBackground =
      Color(0xFF212529); // Text on background
  static const Color lightOnSurface = Color(0xFF212529); // Text on surface
  static const Color lightOnError = Color(0xFFFFFFFF); // Text on error

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF1a6331); // Darker green
  static const Color darkSecondary = Color(0xFF22577a); // Darker blue
  static const Color darkBackground = Color(0xFF121212); // Dark background
  static const Color darkSurface = Color(0xFF1e1e1e); // Dark surface
  static const Color darkError = Color(0xFFd90429); // Dark error
  static const Color darkOnPrimary = Color(0xFFFFFFFF); // Text on primary
  static const Color darkOnSecondary = Color(0xFFFFFFFF); // Text on secondary
  static const Color darkOnBackground = Color(0xFFFFFFFF); // Text on background
  static const Color darkOnSurface = Color(0xFFFFFFFF); // Text on surface
  static const Color darkOnError = Color(0xFFFFFFFF); // Text on error

  /// Generates a MaterialColor swatch from a base color
  static MaterialColor primarySwatch = generateMaterialColor(lightPrimary);

  static MaterialColor generateMaterialColor(Color color) {
    List<double> strengths = [.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
