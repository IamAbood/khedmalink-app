import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/already_have_account_check.dart';
import 'package:khedma_link/constants/widgets/rounded_button.dart';
import 'package:khedma_link/constants/widgets/rounded_input_field.dart';
import 'package:khedma_link/constants/widgets/rounded_password_field.dart';
import 'package:khedma_link/screens/Signup/comonents/background.dart';
import 'package:khedma_link/screens/Signup/comonents/or_divider.dart';
import 'package:khedma_link/screens/login/login_screen.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.05),
                  const Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F9),
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
                          hintText: "First Name",
                          icon: Icons.person_outline,
                          controller: _firstNameController,
                          onChanged: (value) {},
                        ),
                        RoundedInputField(
                          hintText: "Last Name",
                          icon: Icons.person_outline,
                          controller: _lastNameController,
                          onChanged: (value) {},
                        ),
                        RoundedInputField(
                          hintText: "Your Email",
                          icon: Icons.email_outlined,
                          onChanged: (value) {},
                        ),
                        RoundedInputField(
                          hintText: "Phone Number",
                          icon: Icons.phone,
                          onChanged: (value) {},
                        ),
                        RoundedInputField(
                          hintText: "Portfolio Link (https://...)",
                          icon: Icons.link,
                          onChanged: (value) {
                            if (!value.startsWith("https://")) {
                              debugPrint(
                                  "Portfolio link should start with https://");
                            }
                          },
                        ),
                        RoundedPasswordField(
                          onChanged: (value) {},
                        ),
                        RoundedButton(
                          text: "SIGN UP",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const OrDivider(),
                  SizedBox(height: size.height * 0.02),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  ),
                  const Spacer(),
                  const SizedBox(height: TSizes.defaultSpace)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
