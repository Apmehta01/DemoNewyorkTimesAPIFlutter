
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GradientBorder extends ShapeBorder {
  final double width;
  final Gradient gradient;

  const GradientBorder({
    required this.width,
    required this.gradient,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect.deflate(width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10.0)));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10.0)), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}