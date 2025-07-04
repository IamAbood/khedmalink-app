import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color = buttounColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: 280,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          backgroundColor: color,
          minimumSize: const Size(279, 72),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 19),
        ),
      ),
    );
  }
}
