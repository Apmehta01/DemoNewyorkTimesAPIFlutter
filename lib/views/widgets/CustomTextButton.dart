// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../utils/Constants.dart';
import 'CustomText.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGradient;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final double fontSize;
  final bool caps;
  final bool doubleInfinity;
  final TextAlign textAlign;
  final double? width;
  final bool addStartPadding;
  final bool addEndPadding;
  final double paddingStartEnd;
  final bool isBorder;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isGradient = false,
    this.backgroundColor = AppColors.dark_grey,
    this.textColor = Colors.white,
    this.borderColor = AppColors.color_primary,
    this.borderWidth = 0.0,
    this.borderRadius = 10.0,
    this.padding = 16.0,
    this.fontSize = 16.0,
    this.caps = false,
    this.doubleInfinity = false,
    this.textAlign = TextAlign.center,
    this.width,
    this.addStartPadding = false,
    this.addEndPadding = false,
    this.paddingStartEnd = 16.0,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonDecoration = isGradient
        ? BoxDecoration(
      gradient: const LinearGradient(
        colors: [AppColors.gradient_one_primary, AppColors.gradient_two_primary],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    )
        : BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: isBorder
          ? Border.all(
        color: borderColor,
        width: borderWidth,
      )
          : null,
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: buttonDecoration,
        padding: EdgeInsets.only(left: addStartPadding ? padding : 0, right: addEndPadding ? padding : 0),
        child: Container(
          padding: EdgeInsets.all(padding),
          width: doubleInfinity ? double.infinity : width,
          child: CustomText(
            text: caps ? text.toUpperCase() : text,
            color: textColor,
            fontFamily: Constants.APP_FONT,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
