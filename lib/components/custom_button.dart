import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? routeName;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    this.routeName,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.deepPurple,
    this.width = 200,
    this.height = 45,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          } else if (routeName != null) {
            Get.toNamed(routeName!);
          }
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
