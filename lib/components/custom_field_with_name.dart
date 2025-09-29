import 'package:flutter/material.dart';

import 'custom_formfield.dart';

class CustomFormFieldWithName extends StatelessWidget {
  const CustomFormFieldWithName({
    super.key,
    required this.controller,
    required this.hint,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.suffix,
  });
  final TextEditingController controller;
  final String title;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;

  // Helper Widgets

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5, bottom: 3, top: 10),
          child: Text(title, style: const TextStyle(fontSize: 12)),
        ),
        CustomFormField(
          controller: controller,
          hint: hint,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          suffix: suffix,
        ),
      ],
    );
  }
}
