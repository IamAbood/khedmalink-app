import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/Signup/signup_screen.dart';
import 'package:khedma_link/screens/login/login_screen.dart';
import 'package:khedma_link/screens/welcome/components/background.dart';
import '../../../constants/widgets/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'WELCOME TO KHEDMA LINK',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.02),
            Image.asset(
              'assets/images/khedmaLink.png',
              height: 299,
              width: 300,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
                text: "Signup",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignupScreen();
                      },
                    ),
                  );
                }),
            RoundedButton(
              text: "Login",
              // ignore: deprecated_member_use
              color: buttounColor.withOpacity(0.70),
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
