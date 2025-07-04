import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';

class ForgetPassword extends StatelessWidget {
  final VoidCallback press;
  const ForgetPassword({
    super.key,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Forgot your password?",
          style: TextStyle(color: buttounColor),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: press,
          child: const Text(
            "Reset here",
            style: TextStyle(
              color: buttounColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
