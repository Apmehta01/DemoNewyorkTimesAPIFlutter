// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../resources/AppColors.dart';

class CustomCard<T extends ShapeBorder> extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? elevation;
  final T shape;
  final Widget child;
  final bool isGradientBorder;

  const CustomCard({
    Key? key,
    this.color,
    this.width,
    this.elevation,
    required this.shape,
    required this.child,
    this.isGradientBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGradientBorder
        ? Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: const LinearGradient(
          colors: [AppColors.gradient_one_primary,AppColors.gradient_two_primary],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Card(
        elevation: elevation ?? 5.0,
        shape: shape,
        color: color,
        child: child,
      ),
    )
        : Card(
      elevation: elevation ?? 5.0,
      shape: shape,
      color: color,
      child: child,
    );
  }
}