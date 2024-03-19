// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TweenAnimationBuilderWidget<T> extends StatelessWidget {
  final T begin;
  final T end;
  final Duration duration;
  final Widget Function(BuildContext, T, Widget?) builder;
  final VoidCallback? onAnimationEnd;

  const TweenAnimationBuilderWidget({super.key,
    required this.begin,
    required this.end,
    required this.duration,
    required this.builder,
    this.onAnimationEnd,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<T>(
      tween: Tween<T>(begin: begin, end: end),
      duration: duration,
      builder: (context, value, child) {
        return builder(context, value, child);
      },
      onEnd: onAnimationEnd,
    );
  }
}
