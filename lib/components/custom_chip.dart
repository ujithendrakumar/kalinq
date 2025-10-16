import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.title,
    this.tileColor = const Color(0xFFEEEEEE),
    this.textColor = Colors.black54,
    this.onTap,
  });
  final String title;
  final Color tileColor;
  final Color textColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(108.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
