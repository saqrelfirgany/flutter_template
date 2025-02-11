import 'package:flutter/material.dart';

import '../../../../../core/theme/theme_service.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/scaling_helper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome Back',
            style: AppFonts.heading1(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          _buildEmailField(context),
          const SizedBox(height: 20),
          _buildPasswordField(context),
          const SizedBox(height: 30),
          _buildLoginButton(context),
          const SizedBox(height: 20),
          _buildForgotPassword(context),
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      style: AppFonts.body(context),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: AppFonts.caption(context),
        prefixIcon: Icon(
          Icons.email,
          color: ThemeService.onBackgroundColor(context).withOpacity(0.6),
        ),
      ),
      validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: AppFonts.body(context),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: AppFonts.caption(context),
        prefixIcon: Icon(
          Icons.lock,
          color: ThemeService.onBackgroundColor(context).withOpacity(0.6),
        ),
      ),
      validator: (value) =>
          value!.isEmpty ? 'Please enter your password' : null,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(ScalingHelper.responsiveFontSize(context, 12)),
        backgroundColor: ThemeService.primaryColor(context),
      ),
      onPressed: _handleLogin,
      child: Text(
        'Sign In',
        style: AppFonts.buttonText(context),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: AppFonts.caption(context).copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic
    }
  }
}
