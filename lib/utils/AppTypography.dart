// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  /*static const double headerFontSize = 24.0;
  static const double mediumFontSize = 20.0;
  static const double bigFontSize = 22.0;
  static const double titleFontSize = 18.0;
  static const double descriptionFontSize = 16.0;
  static const double small_descriptionFontSize = 14.0;*/

  static double headerFontSize = 24.sp;
  static double bigFontSize = 22.sp;
  static double mediumFontSize = 20.sp;
  static double titleFontSize = 18.sp;
  static double descriptionFontSize = 16.sp;
  static double smallDescriptionFontSize = 14.sp;
  static double tinyFontSize = 12.sp;

  static TextStyle headerTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
      fontSize: headerFontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle titleTextStyle({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
      fontSize: titleFontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle descriptionTextStyle({
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: descriptionFontSize,
      color: color,
    );
  }
}
