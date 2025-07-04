import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/text_filed_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;

  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.hintStyle,
    this.textStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      childe: TextField(
        onChanged: onChanged,
        controller: controller,
        style: textStyle ?? const TextStyle(color: Color(0xFF1E1E2C)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? const TextStyle(color: Color(0xFFB0B0C3)),
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: buttounColor,
          ),
        ),
      ),
    );
  }
}
