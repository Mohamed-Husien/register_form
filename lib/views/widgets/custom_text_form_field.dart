import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  });
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      maxLines: maxLines,
      cursorColor: const Color(0xffA2A8B7),
      style: const TextStyle(
        color: Colors.black, // <-- Change text color to white
      ),
      decoration: InputDecoration(
        border: buildBorder(),
        label: Text(hint),
        labelStyle: const TextStyle(
          color: Color(0xff2C385D),
        ),
        enabledBorder: buildBorder(const Color(0xff007BFF)),
        focusedBorder: buildBorder(const Color(0xff007BFF)),
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: const TextStyle(
          color: Color(0xff2C385D),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: Color ?? Colors.white,
      ),
    );
  }
}
