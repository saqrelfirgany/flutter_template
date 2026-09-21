# Flutter Clean Architecture Template 🚀

# A Flutter starter template built around Clean Architecture layering, responsive
# design (`responsive_framework`), and Dio-based networking. No state-management
# package is wired in yet.

## Features ✨

- **🏗 Clean Architecture Implementation**
  - Clear separation of Presentation, Domain, and Data layers
  - SOLID principles compliance
  - Testable and maintainable codebase

- **📱 Adaptive UI Design**
  - Responsive layouts for mobile, tablet & desktop
  - Dynamic screen breakpoints
  - Orientation-aware components

- **🌓 Theme Management**
  - Dark/Light mode support
  - System theme synchronization
  - Custom theme extensions

- **⚡ State Management**
  - No state management package yet — screens use plain `StatelessWidget`/`StatefulWidget`
  - The Clean Architecture layers (data/domain/presentation) are in place and ready for one to be wired in

- **🌐 Network Layer**
  - Dio HTTP client with interceptors
  - Custom error handling
  - API response parsing
  - Logging & monitoring

- **🧩 Component Library**
  - Reusable widgets (`ResponsiveLayout`)
  - Form validation (see `LoginForm`)

## Getting Started 🏁

### Prerequisites

- Flutter SDK compatible with Dart ≥3.6.0 (`pubspec.yaml`'s `environment.sdk: ^3.6.0`)
- Android Studio or VS Code
- GitHub account

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/saqrelfirgany/flutter_template.git
cd flutter_template
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run -d chrome
```

## Project Structure 🗂️

The structure actually on disk today (`features/auth` is the only feature so far, and it is thinner than a full Clean Architecture skeleton — no `datasources/`, abstract `repositories/` contracts, `usecases/`, or `cubits/` yet):

```bash
lib/
├── core/
│   ├── constants/       # App colors
│   ├── helpers/         # Dio client wrapper
│   ├── theme/           # Theme configuration + theme_service
│   ├── utils/           # Fonts, responsive scaling helper
│   └── widgets/         # ResponsiveLayout
│
├── features/
│   └── auth/             # Authentication feature (stub)
│       ├── data/
│       │   └── repositories/  # AuthRepository (stub implementation)
│       ├── domain/
│       │   └── entities/      # User
│       └── presentation/
│           └── screen/        # LoginScreen + body/LoginForm
│
└── main.dart             # Application entry point
```

There is also a `labs/` folder at the repo root (outside `lib/`) with one demo, `flow-radial-menu/` — **this is a stale copy**; new labs belong in the separate `flutter_labs` project, not here.

## Responsive Design Implementation 📐

### Core Components

1. **responsive_framework** Package
    - Breakpoint management
    - Auto-scale functionality
    - Fluid layout transitions

2. **Breakpoint System**
```dart
static const double mobile = 600;   // < 600px
static const double tablet = 900;   // 601-900px
static const double desktop = 1200; // > 901px
```

3. **Responsive Layout Widget**
```dart
ResponsiveRowColumn(
  layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
  rowSpacing: 40,
  columnSpacing: 20,
  children: [
    ResponsiveRowColumnItem(child: LeftPanel()),
    ResponsiveRowColumnItem(child: RightPanel())
  ]
)
```

4. **Dynamic Scaling**
```dart
// Font scaling
Text(
  'Hello World',
  style: TextStyle(
    fontSize: ScalingHelper.responsiveFontSize(context, 16)
  )
)

// Padding scaling
Padding(
  padding: ScalingHelper.responsivePadding(context)
)
```

### Best Practices

- Use `MediaQuery` for screen dimensions
- Implement `OrientationBuilder` for layout changes
- Utilize `FractionallySizedBox` for relative sizing
- Test on multiple device profiles

## Packages Used 📦

The packages actually declared in `pubspec.yaml` today — no state-management, navigation, or testing-mock packages are in it yet:

| Package | Version | Purpose |
|---------|---------|---------|
| [responsive_framework](https://pub.dev/packages/responsive_framework) | ^1.5.1 | Responsive layouts |
| [dio](https://pub.dev/packages/dio) | ^5.8.0+1 | HTTP client |
| [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger) | ^1.4.0 | Dio request/response logging |
| [adaptive_theme](https://pub.dev/packages/adaptive_theme) | ^3.7.0 | Light/dark theme management |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | ^2.0.17 | SVG rendering |

## Contribution Guide 🤝

### Setup for Development

1. **Fork the repository**
```bash
gh repo fork https://github.com/saqrelfirgany/flutter_template
```

2. **Create feature branch**
```bash
git checkout -b feature/your-feature-name
```

3. **Commit changes**
```bash
git commit -m "feat: add new authentication flow"
```

4. **Push changes**
```bash
git push origin feature/your-feature-name
```

5. **Create Pull Request**

### Coding Standards

1. **Architecture**
    - Follow Clean Architecture principles
    - Keep business logic in domain layer
    - Isolate platform-specific code

2. **Style Guide**
    - Dart 3 style guide compliance
    - Effective Dart conventions
    - 2-space indentation
    - PascalCase for classes
    - snake_case for files

3. **Testing**
    - 80%+ test coverage
    - Widget tests for UI components
    - Unit tests for business logic
    - Mock external dependencies

4. **Documentation**
    - Document public APIs
    - Add inline comments for complex logic
    - Update README for new features


## Roadmap 🗺️

From `DEVLOG.md`'s latest entry:
- [ ] Wire up real authentication — `AuthRepository` is still a stub
- [ ] Add test coverage for the login form's validation logic

## License 📄

This project is licensed under the [MIT License](LICENSE).

---

**Let's build something amazing together!** 👩💻👨💻

[![Open in GitHub](https://img.shields.io/badge/GitHub-View%20on%20GitHub-blue?logo=GitHub)](https://github.com/saqrelfirgany/flutter_template)
