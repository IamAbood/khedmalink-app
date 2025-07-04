import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/text_filed_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    this.hintStyle,
    this.textStyle,
  });

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      childe: TextField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        style: widget.textStyle ?? const TextStyle(color: Color(0xFF1E1E2C)),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle:
              widget.hintStyle ?? const TextStyle(color: Color(0xFFB0B0C3)),
          icon: const Icon(
            Icons.lock,
            color: buttounColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: buttounColor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
