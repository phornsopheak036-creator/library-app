
import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign in button clicked!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // HEADER SECTION
            Container(
              height: 175,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF17223E),
              ),
              child: Stack(
                children: [

                  // Decorative circle
                  Positioned(
                    right: -35,
                    top: -40,
                    child: Container(
                      width: 145,
                      height: 145,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1E315F),
                      ),
                    ),
                  ),

                  // Logo
                  const Positioned(
                    top: 10,
                    left: 0,
                    child: AppLogo(),
                  ),

                  // Library title
                  const Positioned(
                    left: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LIBRARY MANAGEMENT',
                          style: TextStyle(
                            color: Color(0xFFB8C7F0),
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Your library,\nneatly\norganized.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            height: 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Book illustration
                  Positioned(
                    right: 0,
                    bottom: 12,
                    child: SizedBox(
                      width: 85,
                      height: 85,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 8,
                            child: Transform.rotate(
                              angle: -0.08,
                              child: Container(
                                width: 54,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF34476E),
                                  borderRadius:
                                      BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Colors.white24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Transform.rotate(
                              angle: 0.12,
                              child: Container(
                                width: 44,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4269E4),
                                  borderRadius:
                                      BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // LOGIN FORM SECTION
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Color(0xFF17223E),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Sign in to manage books, members, and circulation.',
                      style: TextStyle(
                        color: Color(0xFF8B94A8),
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // EMAIL LABEL
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF26334E),
                      ),
                    ),

                    const SizedBox(height: 7),

                    // EMAIL INPUT
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'librarian@midnight.org',
                        hintStyle: const TextStyle(
                          color: Color(0xFFA5AEC1),
                          fontSize: 12,
                        ),
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          size: 17,
                          color: Color(0xFF68758F),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                          borderSide: const BorderSide(
                            color: Color(0xFFE1E5ED),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                          borderSide: const BorderSide(
                            color: Color(0xFFE1E5ED),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                          borderSide: const BorderSide(
                            color: Color(0xFF315BE5),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // PASSWORD LABEL
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF26334E),
                      ),
                    ),

                    const SizedBox(height: 7),

                    // PASSWORD INPUT
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFA5AEC1),
                          fontSize: 12,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 17,
                          color: Color(0xFF68758F),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword =
                                  !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 17,
                            color: const Color(0xFF68758F),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                          borderSide: const BorderSide(
                            color: Color(0xFFE1E5ED),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                          borderSide: const BorderSide(
                            color: Color(0xFFE1E5ED),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(9),
                          borderSide: const BorderSide(
                            color: Color(0xFF315BE5),
                          ),
                        ),
                      ),
                    ),

                    // FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Color(0xFF315BE5),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // SIGN IN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: signIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF315BE5),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_forward, size: 16),
                            SizedBox(width: 8),
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // CREATE ACCOUNT
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'New to Midnight Library? ',
                            style: TextStyle(
                              color: Color(0xFF8B94A8),
                              fontSize: 11,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                color: Color(0xFF315BE5),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
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
