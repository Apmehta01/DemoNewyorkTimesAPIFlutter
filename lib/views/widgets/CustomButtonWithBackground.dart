// ignore_for_file: non_constant_identifier_names, file_names

import 'package:demonewyorktimeapi/utils/color_extensions.dart';
import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../utils/Constants.dart';
import 'CustomImage.dart';
import 'CustomText.dart';

class CustomButtonWithBackground extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGradient;
  final bool
      isBackground; // New property to determine if image background should be applied
  final AssetImage?
      backgroundImage; // New property to store the background image
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
  final bool hasSuffixIcon;
  final AssetImage? suffixIconImage;
  final Color suffixIconColor;

  const CustomButtonWithBackground({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isGradient = false,
    this.isBackground = false, // Initialize isBackground to false
    this.backgroundImage, // Initialize backgroundImage to null
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
    this.hasSuffixIcon = false,
    this.suffixIconImage,
    this.suffixIconColor = AppColors.dark_grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonDecoration = isGradient
        ? const BoxDecoration()
        : isBackground // Check if background image should be applied
            ? BoxDecoration(
                // Image background decoration
                image: DecorationImage(
                  image: backgroundImage!,
                  fit: BoxFit.cover,
                ),
                color: AppColors.color_primary.lighten().withOpacity(0.7),
                borderRadius: BorderRadius.circular(borderRadius),
                border: isBorder
                    ? Border.all(
                        color: borderColor,
                        width: isBorder ? borderWidth : 0.0,
                      )
                    : null,
              )
            : const BoxDecoration(
                // Normal background color decoration
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
        child: hasSuffixIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
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
                  CustomImage(
                    imageUrlOrXml: suffixIconImage!.assetName,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                    color: suffixIconColor,
                    showPrimaryColor: true,
                  ),
                ],
              )
            : SizedBox(
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
