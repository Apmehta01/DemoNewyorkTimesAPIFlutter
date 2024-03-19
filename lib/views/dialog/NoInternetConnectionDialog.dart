// ignore_for_file: file_names, use_build_context_synchronously,slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../resources/AppColors.dart';
import '../../utils/AppStrings.dart';
import '../../utils/AppTypography.dart';
import '../../utils/Constants.dart';
import '../../utils/NetworkUtils.dart';
import '../widgets/CustomCardGradient.dart';
import '../widgets/CustomImage.dart';
import '../widgets/CustomText.dart';
import '../widgets/GradientText.dart';

const String tag = "NoInternetConnectionDialog";

class NoInternetConnectionDialog extends StatefulWidget {
  const NoInternetConnectionDialog({super.key});

  @override
  State<NoInternetConnectionDialog> createState() =>
      NoInternetConnectionDialogState();
}

class NoInternetConnectionDialogState
    extends State<NoInternetConnectionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        padding: const EdgeInsets.all(10.0),
        child: CustomCardGradient(
          color: AppColors.White,
          width: double.infinity,
          elevation: 5.0,
          isGradientBorder: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Display the ListView with ListTile widgets
                  const CustomImage(
                    imageUrlOrXml:
                        '${Constants.STR_BASE_URL_ASSETS}ic_no_internet.png',
                    width: 200.0,
                    height: 130.0,
                    fit: BoxFit.contain,
                    color: AppColors.color_primary,
                    showPrimaryColor: false,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GradientText(
                    text: AppStrings.STR_NO_INTERNET_ERROR,
                    fontSize: AppTypography.titleFontSize,
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                    fontFamily: Constants.APP_FONT,
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.gradient_one_primary,
                        AppColors.gradient_two_primary
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.gradient_one_primary,
                            AppColors.gradient_two_primary,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: LoadingBtn(
                        height: 50,
                        roundLoadingShape: false,
                        borderRadius: 8,
                        color: Colors.transparent,
                        animate: true,
                        width: MediaQuery.of(context).size.width * 0.45,
                        loader: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Center(
                                child: LoadingIndicator(
                              indicatorType: Indicator.ballRotateChase,
                              colors: [
                                AppColors.White,
                                AppColors.White,
                                AppColors.White,
                                AppColors.White
                              ],
                              strokeWidth: 5,
                              backgroundColor: Colors.transparent,
                              pathBackgroundColor: AppColors.White,
                            ))),
                        child: CustomText(
                          text: AppStrings.STR_RETRY.toUpperCase(),
                          color: AppColors.White,
                          fontSize: AppTypography.titleFontSize,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontFamily: Constants.APP_FONT,
                        ),
                        onTap: (startLoading, stopLoading, btnState) async {
                          if (btnState == ButtonState.idle) {
                            startLoading();
                            await Future.delayed(const Duration(seconds: 2));
                            if (await NetworkUtils.isInternetAvailable()) {
                              Navigator.of(context).pop();
                            }
                            stopLoading();
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
