// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import 'CustomCard.dart';
import 'CustomImage.dart';
import 'CustomText.dart';


class CustomNoDataFound extends StatelessWidget {
  final String? message;
  final String imagePath;
  const CustomNoDataFound({super.key, required this.message, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCard<RoundedRectangleBorder>(
        color: AppColors.White,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: AppColors.color_primary,
              // Set the desired border color here
              width: 3.0, // Set the border width
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImage(
                imageUrlOrXml: imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                color: AppColors.color_primary,
              ),
              const SizedBox(height: 16),
              CustomText(
                text: message!,
                color: AppColors.color_primary,
                fontFamily: Constants.APP_FONT,
                fontSize: AppTypography.headerFontSize,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}