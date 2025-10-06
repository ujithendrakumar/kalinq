import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.maxLines = 1,
    this.inputFormaters,
  });
  final TextEditingController controller;
  final String title;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final int maxLines;
  final List<TextInputFormatter>? inputFormaters;

  // Helper Widgets

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5, bottom: 3, top: 10),
            child: Text(title, style: const TextStyle(fontSize: 13)),
          ),
          CustomFormField(
            controller: controller,
            hint: hint,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
            suffix: suffix,
            maxLines: maxLines,
            inputFormaters: inputFormaters,
          ),
        ],
      ),
    );
  }
}
