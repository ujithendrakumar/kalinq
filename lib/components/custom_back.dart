import 'package:flutter/material.dart';

import '../utils/theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          decoration: BoxDecoration(
            color: jyellowLightColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/icons/left.png', scale: 3.5),
        ),
      ),
    );
  }
}
