// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';
import 'GradientBorder.dart';

class CustomCardGradientTwo extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? elevation;
  final Color? shadowColor;
  final Widget child;
  final bool isGradientBorder;


  const CustomCardGradientTwo({
    Key? key,
    this.color,
    this.width,
    this.elevation,
    this.shadowColor,
    required this.child,
    this.isGradientBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 5.0,
      shadowColor:shadowColor ,
      shape: isGradientBorder
          ? GradientBorder(
              width: 3.0,
              gradient: LinearGradient(
                colors: [
                  AppColors.gradient_two_primary.withOpacity(0.50),
                  AppColors.gradient_one_primary.withOpacity(0.75)],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            )
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: AppColors.White,
                width: 2.0,
              ),
            ),
      color: color,
     /* color: colorFromGradient(const LinearGradient(
          colors: [AppColors.gradient_one_primary, AppColors.gradient_two_primary],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),*/
      child: child,
    );
  }

  Color? colorFromGradient(LinearGradient gradient) {
    if (gradient == null) {
      return null;
    }

    final decoration = BoxDecoration(gradient: gradient);
    return decoration.color;
  }
}
