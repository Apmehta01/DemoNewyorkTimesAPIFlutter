import 'package:flutter/material.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0); // Move to top-right corner
    path.arcToPoint(
      Offset(0, size.height), // End at bottom-left corner
      radius: Radius.circular(size.height), // Radius of the half-circle
      clockwise: false, // Draw counter-clockwise
    );
    path.lineTo(size.width, size.height); // Draw bottom-right edge
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
