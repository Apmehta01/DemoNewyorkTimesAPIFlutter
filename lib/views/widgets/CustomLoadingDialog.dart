// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../resources/AppColors.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import 'GradientText.dart';

class CustomLoadingDialog extends StatelessWidget {
  final String message;

  const CustomLoadingDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const SizedBox(
              height: 70, // Set the desired height here
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [
                  AppColors.gradient_one_primary,
                  AppColors.gradient_two_primary,
                  AppColors.gradient_one_accent,
                  AppColors.gradient_two_accent
                ],
                strokeWidth: 5,
                backgroundColor: AppColors.White,
                pathBackgroundColor: AppColors.White,
              ),
            ),
            const SizedBox(height: 16),
            GradientText(
              text: message,
              fontFamily: Constants.APP_FONT,
              fontSize: AppTypography.descriptionFontSize,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              gradient: const LinearGradient(
                colors: [
                  AppColors.gradient_one_primary,
                  AppColors.gradient_two_primary
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
