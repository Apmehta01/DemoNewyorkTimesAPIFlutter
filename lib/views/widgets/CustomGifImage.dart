// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomGifImage extends StatelessWidget {
  final String gifAssetPath;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomGifImage({
    Key? key,
    required this.gifAssetPath,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      gifAssetPath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}