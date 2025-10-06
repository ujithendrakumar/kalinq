import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.suffix,
    this.enablePrefixIcon = false,
    this.prefixIcon = const Icon(Icons.search, size: 20),
    this.maxLines = 1,
    this.inputFormaters,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool enablePrefixIcon;
  final Widget prefixIcon;
  final int maxLines;
  final List<TextInputFormatter>? inputFormaters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // style: const TextStyle(fontSize: 14),
      minLines: 1,

      obscureText: obscureText,

      decoration: InputDecoration(
        isDense: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        filled: true,
        fillColor: Colors.grey.shade100,
        //  fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
        suffixIcon: suffix,
        prefixIcon: enablePrefixIcon ? prefixIcon : null,
        // 👇 Reserve space for error text
        errorStyle: const TextStyle(
          fontSize: 10,
          color: Colors.red,
          height: 0.8,
        ),
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        constraints: const BoxConstraints(
          minHeight: 43,
          maxHeight: 65, // enough room for error message
        ),
      ),
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: inputFormaters ?? [],
    );
  }
}
