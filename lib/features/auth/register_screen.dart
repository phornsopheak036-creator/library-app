import 'package:flutter/material.dart';
import 'package:num_library/core/constants/app_colors.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/core/utils/validators.dart';
import 'package:num_library/shared/widgets/app_text_field.dart';
import 'package:num_library/shared/widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    for (final c in [_name, _email, _phone, _password, _confirm]) {
      c.dispose();
    }
    super.dispose();
  }

  void _create() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account created! Please sign in.')));
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Create Account',
                  style: TextStyle(color: AppColors.navy, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Join Read-daily to manage your library.',
                  style: TextStyle(color: AppColors.textGrey, fontSize: 13)),
              const SizedBox(height: 22),
              AppTextField(label: 'Full Name', hint: 'Your full name', icon: Icons.person_outline, controller: _name,
                  validator: (v) => Validators.required(v, 'Name')),
              const SizedBox(height: 14),
              AppTextField(label: 'Email', hint: 'name@email.com', icon: Icons.mail_outline, controller: _email,
                  keyboardType: TextInputType.emailAddress, validator: Validators.email),
              const SizedBox(height: 14),
              AppTextField(label: 'Phone Number', hint: '012 345 678', icon: Icons.phone_outlined, controller: _phone,
                  keyboardType: TextInputType.phone, validator: (v) => Validators.required(v, 'Phone')),
              const SizedBox(height: 14),
              AppTextField(label: 'Password', hint: 'At least 6 characters', icon: Icons.lock_outline,
                  controller: _password, obscure: true, validator: Validators.password),
              const SizedBox(height: 14),
              AppTextField(
                label: 'Confirm Password',
                hint: 'Repeat password',
                icon: Icons.lock_outline,
                controller: _confirm,
                obscure: true,
                validator: (v) => v != _password.text ? 'Passwords do not match' : null,
              ),
              const SizedBox(height: 24),
              PrimaryButton(text: 'Create Account', onPressed: _create),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Already have an account? Sign in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
