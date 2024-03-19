// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image/image.dart' as img;

import '../../utils/Constants.dart';

class CustomGradientImage extends StatelessWidget {
  final String imageUrlOrXml;
  final double width;
  final double height;
  final BoxFit fit;
  final Gradient gradient;

  const CustomGradientImage({
    Key? key,
    required this.imageUrlOrXml,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: ClipRect(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return gradient.createShader(bounds);
              },
              child: SizedBox(
                width: width,
                height: height,
                child: getImageWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImageWidget() {
    if (imageUrlOrXml.toLowerCase().endsWith('.svg')) {
      if (imageUrlOrXml.startsWith('<svg')) {
        return SvgPicture.string(
          imageUrlOrXml,
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return SvgPicture.asset(
          imageUrlOrXml,
          width: width,
          height: height,
          fit: fit,
        );
      }
    }else if (imageUrlOrXml.toLowerCase().endsWith('.bmp')) {
      // Load BMP image using the image package
      Uint8List bmpBytes = Uint8List.fromList(imageUrlOrXml.codeUnits);
      img.Image? bmpImage = img.decodeImage(Uint8List.fromList(bmpBytes));
      if (bmpImage != null) {
        return Image.memory(
          Uint8List.fromList(img.encodeBmp(bmpImage)),
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        // Handle the case where decoding the BMP image fails
        return Image.asset(
          '${Constants.STR_BASE_URL_ASSETS}ic_no_image.png', // Use Image.asset for PNG images
          width: width,
          height: height,
          fit: fit,
          // color: currentColor,
        ); // or any other fallback UI element
      }
    } else {
      return Image.asset(
        imageUrlOrXml,
        width: width,
        height: height,
        fit: fit,
      );
    }
  }
}