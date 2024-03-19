// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CenteredStackWidget extends StatelessWidget {
  final Widget child;

  const CenteredStackWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}