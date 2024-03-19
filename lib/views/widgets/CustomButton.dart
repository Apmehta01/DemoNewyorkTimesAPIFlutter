// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../utils/Constants.dart';
import 'CustomText.dart';

class CustomButton extends StatelessWidget {
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
  final bool double_infinity;
  final TextAlign textAlign;
  final double? width;
  final bool addStartPadding;
  final bool addEndPadding;
  final double paddingStartEnd;
  final bool isBorder;
  final FontWeight fontWeight;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isGradient = false, // Initialize isGradient to false
    this.backgroundColor = AppColors.dark_grey,
    this.textColor = Colors.white,
    this.borderColor = AppColors.color_primary,
    this.borderWidth = 0.0,
    this.borderRadius = 10.0,
    this.padding = 16.0,
    this.fontSize = 16.0,
    this.caps = false,
    this.double_infinity = false,
    this.textAlign = TextAlign.center,
    this.width,
    this.addStartPadding = false,
    this.addEndPadding = false,
    this.paddingStartEnd = 16.0,
    this.isBorder = false,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonDecoration = isGradient
        ? BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.gradient_one_primary,
                AppColors.gradient_two_primary
              ],
              // colors: [AppColors.gradient_one_primary.withOpacity(0.75), AppColors.gradient_two_primary.withOpacity(0.50)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            border: isBorder
                ? Border.all(
                    color: borderColor,
                    width: isBorder ? borderWidth : 0.0,
                  )
                : null,
          )
        : BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: isBorder
                ? Border.all(
                    color: borderColor,
                    width: isBorder ? borderWidth : 0.0,
                  )
                : null,
          );

    return Container(
      decoration: buttonDecoration,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.only(
                left: paddingStartEnd,
                right: paddingStartEnd,
                top: padding,
                bottom: padding),
          ),
          overlayColor: MaterialStateProperty.all<Color>(
            AppColors.color_primary,
          ),
        ),
        child: SizedBox(
          width: double_infinity ? double.infinity : width,
          child: CustomText(
            text: caps ? text.toUpperCase() : text,
            color: textColor,
            fontFamily: Constants.APP_FONT,
            fontSize: fontSize,
            fontWeight: fontWeight,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
