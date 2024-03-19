// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../utils/Constants.dart';
import 'CustomText.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.left, // Default to left alignment
    this.fontFamily = Constants.APP_FONT, // Default to Constants.APP_FONT
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: CustomText(
        text: text,
        color: AppColors.White,
        fontSize: fontSize,
        fontWeight: fontWeight,
        textAlign: textAlign, // Use the specified textAlign
        fontFamily: fontFamily, // Use the specified fontFamily
      ),
    );
  }
}