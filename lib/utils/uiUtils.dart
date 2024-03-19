// ignore_for_file: file_names

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:demonewyorktimeapi/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/AppColors.dart';
import '../views/dialog/NoInternetConnectionDialog.dart';
import '../views/widgets/CustomAppBar.dart';
import '../views/widgets/CustomImage.dart';
import '../views/widgets/CustomLoadingDialog.dart';
import '../views/widgets/CustomText.dart';
import '../views/widgets/HalfCircleClipper.dart';
import 'AppTypography.dart';
import 'Constants.dart';

class UiUtils {
  static toastSuccessMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  static toastErrorMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  static void flushBarSuccess(String? message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          // message: message,
          duration: Duration(seconds: int.parse(Constants.FLUSH_TIME_OUT)),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(
              horizontal: Constants.BTN_BORDER_RADIUS,
              vertical: Constants.BTN_PADDING),
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          borderRadius: BorderRadius.circular(Constants.BTN_PADDING),
          backgroundColor: AppColors.color_primary,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          messageText: CustomText(
            text: message!,
            color: AppColors.White,
            fontSize: AppTypography.descriptionFontSize,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            fontFamily: Constants.APP_FONT,
          ),
          icon: const CustomImage(
            imageUrlOrXml: '${Constants.STR_BASE_URL_ASSETS}ic_success.png',
            width: 28.0,
            height: 28.0,
            fit: BoxFit.contain,
            color: AppColors.color_primary,
            showPrimaryColor: false,
          ),
        )..show(context));
  }

  static void flushBarError(String? message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          // message: message,
          duration: Duration(seconds: int.parse(Constants.FLUSH_TIME_OUT)),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(
              horizontal: Constants.BTN_BORDER_RADIUS,
              vertical: Constants.BTN_PADDING),
          padding: const EdgeInsets.all(15),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          messageText: CustomText(
            text: message!,
            color: AppColors.White,
            fontSize: AppTypography.descriptionFontSize,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
            fontFamily: Constants.APP_FONT,
          ),
          icon: const CustomImage(
            imageUrlOrXml: '${Constants.STR_BASE_URL_ASSETS}ic_error.png',
            width: 28.0,
            height: 28.0,
            fit: BoxFit.contain,
            color: AppColors.color_primary,
            showPrimaryColor: false,
          ),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void showCustomLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomLoadingDialog(message: message);
      },
    );
  }

  static Future<void> noInternetConnectionDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const PopScope(
        canPop: false,
        child: NoInternetConnectionDialog(),
      ),
    );
  }

  static showAppBar(bool showBackButton, String title, bool showHomeButton) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: CustomAppBar(
        showBackButton: showBackButton,
        title: title,
        backgroundColor: AppColors.color_primary,
        textColor: AppColors.White,
        showHomeButton: showHomeButton,
        // Set other properties as needed
      ),
    );
  }

  static showTopBackgroundCorner() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: HalfCircleClipper(),
        child: Container(
          width: double.infinity, // Adjust width as needed
          height: 70, // Adjust height as needed
          decoration: BoxDecoration(
            color: AppColors.color_primary
                .lighten()
                .withOpacity(0.4), // Color of the half-circle
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50), // Radius for bottom-left corner
              bottomRight:
                  Radius.circular(50), // Radius for bottom-right corner
            ),
          ), // Color of the half-circle
        ),
      ),
    );
  }

  static Future<DateTime?> showMyDatePicker(BuildContext context) async {
    // Define initial date as today's date
    DateTime initialDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      // Set earliest selectable date
      lastDate: DateTime(2100),
      // Set latest selectable date
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.color_primary,
              // Set primary color of date picker
              onPrimary: Colors.white, // Set text color of selected date
            ),
          ),
          child: child!,
        );
      },
    );
    return selectedDate;
  }
}
