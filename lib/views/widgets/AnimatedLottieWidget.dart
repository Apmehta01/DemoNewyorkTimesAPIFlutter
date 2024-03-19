import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottieWidget extends StatelessWidget {
  final String animationFile;
  final double width;
  final double height;
  final int durationMillis;
  final bool loop;
  final BoxFit fit; // New variable for fit

  const AnimatedLottieWidget({super.key,
    required this.animationFile,
    this.width = 200,
    this.height = 200,
    this.durationMillis = 3000,
    this.loop = true,
    this.fit = BoxFit.contain, // Default value for fit
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animationFile,
      width: width,
      height: height,
      repeat: loop ? true : false,
      fit: fit,
    );
  }
}
