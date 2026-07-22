# DevLog

## 2026-W30

Pulled the template onto a current Flutter install to make sure it still holds up, and it didn't — `flutter analyze` came back with errors and `flutter test` couldn't even run. Cleaned it all up:

- The `dev_dependencies` block was missing entirely, so there was no `flutter_test` and the `flutter_lints` include in `analysis_options.yaml` couldn't resolve. Added both.
- `ThemeData.cardTheme` now wants a `CardThemeData`, not a `CardTheme` — that was a hard compile error in `app_theme.dart`, fixed on both the light and dark themes.
- `login_screen.dart` had a leftover `isVerticalLayout` local that nothing read anymore — removed it.
- `test/widget_test.dart` was empty, so there was nothing for `flutter test` to actually run. Added a real widget test for `ResponsiveLayout`.
- While I was in there I cleared out the deprecation noise too: `ColorScheme.background`/`onBackground` → `surface`/`onSurface`, `Color.withOpacity` → `Color.withValues(alpha: ...)`, `Color.red/green/blue/value` → the new component accessors and `toARGB32()`, `MediaQuery.textScaleFactorOf` → `textScalerOf`, and `SvgPicture`'s `color` → `colorFilter`.
- Added an MIT `LICENSE` and linked it from the README.

Everything now analyzes clean and `flutter test` passes.

**Up next:** wire up real auth (the repository is still a stub), and add coverage for the login form's validation logic.
