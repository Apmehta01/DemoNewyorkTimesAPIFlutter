// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontFamily,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left, // Default to left-aligned
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign, // Use the provided textAlign property
    );
  }
}