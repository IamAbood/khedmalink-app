import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/already_have_account_check.dart';
import 'package:khedma_link/constants/widgets/rounded_button.dart';
import 'package:khedma_link/constants/widgets/rounded_input_field.dart';
import 'package:khedma_link/constants/widgets/rounded_password_field.dart';
import 'package:khedma_link/screens/Signup/comonents/or_divider.dart';
import 'package:khedma_link/screens/Signup/signup_screen.dart';
import 'package:khedma_link/screens/login/components/background.dart';
import 'package:khedma_link/screens/login/components/forget_pass.dart';
import 'package:khedma_link/screens/login/components/reset_password_screen.dart';
import 'package:khedma_link/screens/welcome/freelancer_recruiter/freelancer_recruiters_screen.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Background(
      childe: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.08),
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF1E1E2C),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Login to your account",
              style: TextStyle(
                color: Color(0xFF6C6C80),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F9), //light grey
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 30,
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.15),
                  ),
                ],
              ),
              child: Column(
                children: [
                  RoundedInputField(
                    hintText: "Email",
                    icon: Icons.email,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  RoundedPasswordField(
                    hintStyle: const TextStyle(color: Color(0xFFB0B0C3)),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 24),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const FreelancerRecruitersScreen(),
                        ),
                      );
                    },
                    color: buttounColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            ForgetPassword(
              press: () {
                // Handle password reset navigation
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen()));
              },
            ),
            const OrDivider(),
            const SizedBox(height: 16),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocialIcon(
            //       iconSrc: 'assets/images/facebook.png',
            //       press: () {},
            //     ),
            //     const SizedBox(width: 16),
            //     SocialIcon(
            //       iconSrc: 'assets/images/google.png',
            //       press: () {},
            //     ),
            //   ],
            // ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
