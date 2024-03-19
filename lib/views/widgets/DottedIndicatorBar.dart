// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DottedIndicatorBar extends StatelessWidget {
  final int numberOfDots;
  final int selectedIndex;
  final Color selectedColor;
  final Color deselectedColor;
  final double dotSize;
  final double spacing;

  const DottedIndicatorBar({super.key,
    required this.numberOfDots,
    required this.selectedIndex,
    required this.selectedColor,
    required this.deselectedColor,
    this.dotSize = 10.0,
    this.spacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          numberOfDots,
              (index) => Container(
            width: dotSize,
            height: dotSize,
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selectedIndex ? selectedColor : deselectedColor,
            ),
          ),
        ),
      ),
    );
  }
}