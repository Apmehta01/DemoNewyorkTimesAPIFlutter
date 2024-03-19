
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  CustomPageRoute({required this.builder})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      var curve = Curves.easeInOut;

      var offsetAnimation = Tween(begin: begin, end: end)
          .animate(CurvedAnimation(parent: animation, curve: curve));
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}


/*//Fade In
class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  CustomPageRoute({required this.builder}) // Add the routeName parameter to the constructor
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var fadeOut = Tween<double>(begin: begin, end: -1.0).animate(animation);
      var fadeIn = Tween<double>(begin: begin, end: end).animate(animation);

      return Stack(
        children: [
          FadeTransition(opacity: fadeOut, child: child), // Fade out the outgoing screen
          FadeTransition(opacity: fadeIn, child: child), // Fade in the incoming screen
        ],
      );
    },
  );
}*/