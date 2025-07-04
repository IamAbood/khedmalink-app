import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget childe;
  const TextFieldContainer({
    super.key,
    required this.childe,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: size.width * 0.8,
      decoration: const BoxDecoration(color: Colors.white),
      //borderRadius: BorderRadius.circular(29),
      child: childe,
    );
  }
}
