import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/core/utils/validators.dart';
import 'package:num_library/shared/widgets/app_logo.dart';
import 'package:num_library/shared/widgets/app_text_field.dart';
import 'package:num_library/shared/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _hide = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _signIn() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pushReplacementNamed(context, AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 16, 20, 24),
              color: AppColors.navy,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppLogo(),
                  SizedBox(height: 28),
                  Text('LIBRARY MANAGEMENT',
                      style: TextStyle(color: Color(0xFFB8C7F0), fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                  SizedBox(height: 8),
                  Text('Your library,\nneatly organized.',
                      style: TextStyle(color: Colors.white, fontSize: 26, height: 1.15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Welcome back',
                        style: TextStyle(color: AppColors.navy, fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    const Text('Sign in to manage books, members, and circulation.',
                        style: TextStyle(color: AppColors.textGrey, fontSize: 13)),
                    const SizedBox(height: 22),
                    AppTextField(
                      label: 'Email',
                      hint: 'librarian@readdaily.org',
                      icon: Icons.mail_outline,
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      icon: Icons.lock_outline,
                      controller: _password,
                      obscure: _hide,
                      validator: Validators.password,
                      suffix: IconButton(
                        onPressed: () => setState(() => _hide = !_hide),
                        icon: Icon(_hide ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            size: 20, color: AppColors.textGrey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?', style: TextStyle(color: AppColors.primary, fontSize: 12)),
                      ),
                    ),
                    PrimaryButton(text: 'Sign In', icon: Icons.arrow_forward, onPressed: _signIn),
                    const SizedBox(height: 14),
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Text('New to Read-daily? ',
                              style: TextStyle(color: AppColors.textGrey, fontSize: 13)),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, AppRoutes.register),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text('Create Account',
                                  style: TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
