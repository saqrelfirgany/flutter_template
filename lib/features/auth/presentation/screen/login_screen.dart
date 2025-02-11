import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../core/theme/theme_service.dart';
import '../../../../core/utils/scaling_helper.dart';
import '../../../../core/widgets/responsive_layout.dart';
import 'body/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    final isVerticalLayout = breakpoint.smallerThan(DESKTOP);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeService.surfaceColor(context),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              ThemeService.isDarkMode(context)
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: ThemeService.onSurfaceColor(context),
            ),
            onPressed: () => ThemeService.toggleTheme(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: breakpoint.largerThan(MOBILE)
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ThemeService.primaryColor(context).withOpacity(0.1),
                    Colors.transparent,
                  ],
                )
              : null,
        ),
        child: Center(
          child: ResponsiveLayout(
            mobile: _buildVerticalLayout(context),
            tablet: _buildVerticalLayout(context),
            desktop: _buildHorizontalLayout(context),
          ),
        ),
      ),
    );
  }

  /// Builds the vertical layout for mobile and tablet
  Widget _buildVerticalLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: ScalingHelper.responsivePadding(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIllustration(context),
          const SizedBox(height: 40),
          const LoginForm(),
        ],
      ),
    );
  }

  /// Builds the horizontal layout for desktop
  Widget _buildHorizontalLayout(BuildContext context) {
    return Padding(
      padding: ScalingHelper.responsivePadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _buildIllustration(context),
          ),
          const SizedBox(width: 60),
          const Expanded(
            child: LoginForm(),
          ),
        ],
      ),
    );
  }

  /// Builds the illustration section
  Widget _buildIllustration(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/login.svg',
      color: ThemeService.primaryColor(context),
      width: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
          ? ScalingHelper.responsiveFontSize(context, 200)
          : ScalingHelper.responsiveFontSize(context, 400),
    );
  }
}
