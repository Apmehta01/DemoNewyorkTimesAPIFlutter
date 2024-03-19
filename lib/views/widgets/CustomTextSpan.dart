// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  final String text;
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding; // New property for padding

  const CustomTextSpan({
    Key? key,
    required this.text,
    required this.color,
    required this.fontFamily,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.padding = const EdgeInsets.all(0.0), // Default padding is set to zero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        textAlign: textAlign,
      ),
    );
  }
}
