// ignore_for_file: library_private_types_in_public_api, file_names, slash_for_doc_comments

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

import '../../resources/AppColors.dart';
import '../../utils/AppLogs.dart';
import '../../utils/Constants.dart';

const String tag = "CustomImage";

/**
 * Name: [CustomImage] class
 * <br> Created By Arpan Mehta on 12-09-23
 * <br> Modified By Arpan Mehta on 12-09-23
 * <br> Purpose: This class will use to display image from svg string/svg/from url.
 */

class CustomImage extends StatefulWidget {
  final String imageUrlOrXml;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;
  final bool showPrimaryColor;
  final bool isFromNetwork;
  final bool isFromFile;
  const CustomImage({
    super.key,
    required this.imageUrlOrXml,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
    this.color = Colors.black,
    this.showPrimaryColor = true,
    this.isFromNetwork = false,
    this.isFromFile = false,
  });

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  late Color currentColor;
  BoxFit selectedBoxFit = BoxFit.cover; // Default BoxFit
  @override
  void initState() {
    super.initState();
    currentColor = widget.color;
  }

  void changeColor(Color newColor) {
    setState(() {
      currentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color? imageColor;
    if (widget.showPrimaryColor) {
      imageColor = currentColor;
    }

    if (widget.isFromNetwork) {
      // Load image from network
      if (widget.imageUrlOrXml.toLowerCase().endsWith('.svg')) {
        AppLogs.logMessage(
            tag, 'Error:>>>>>>', widget.imageUrlOrXml.toString());
        // Handle SVG
        return SvgPicture.network(
          widget.imageUrlOrXml,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          color: imageColor,
        );
      } else {
        return FutureBuilder<void>(
          future: _getImageSize(widget.imageUrlOrXml),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.network(
                widget.imageUrlOrXml,
                width: widget.width,
                height: widget.height,
                fit: selectedBoxFit,
                color: imageColor,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    '${Constants.STR_BASE_URL_ASSETS}ic_no_internet.png',
                    width: widget.width,
                    height: widget.height,
                    fit: selectedBoxFit,
                    color: imageColor,
                  ); // Replace YourErrorWidget with your custom error widget
                },
              );
            } else {
              return const LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [
                  AppColors.gradient_one_primary,
                  AppColors.gradient_two_primary,
                  AppColors.gradient_one_accent,
                  AppColors.gradient_two_accent
                ],
                strokeWidth: 5,
                backgroundColor: AppColors.White,
                pathBackgroundColor: AppColors.White,
              ); // or a placeholder widget
            }
          },
        );
      }
    } else {
      // Load image from assets
      if (!widget.isFromFile) {
        if (widget.imageUrlOrXml.toLowerCase().endsWith('.svg')) {
          if (widget.imageUrlOrXml.startsWith('<svg')) {
            return SvgPicture.string(
              widget.imageUrlOrXml,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
              color: imageColor,
            );
          } else {
            return SvgPicture.asset(
              widget.imageUrlOrXml,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
              color: imageColor,
            );
          }
        } else {
          return Image.asset(
            widget.imageUrlOrXml,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            color: imageColor,
          );
        }
      } else {
        return Image.file(File(widget.imageUrlOrXml),
            width: 90.0, height: 90.0, fit: widget.fit);
      }
    }
  }

  Future<Uint8List?> _loadBmpImage(String imageUrl) async {
    try {
      // Fetch BMP image using http package
      http.Response response = await http.get(Uri.parse(imageUrl));

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Convert response body (BMP image bytes) to Uint8List
        Uint8List bmpBytes = Uint8List.fromList(response.bodyBytes);
        return bmpBytes;
      } else {
        // Handle non-200 status codes if necessary
        print('Failed to load BMP image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle errors during the HTTP request
      print('Error loading BMP image: $e');
      return null;
    }
  }

  Future<void> _getImageSize(String imageUrl) async {
    if (widget.isFromNetwork) {
      try {
        http.Response response = await http.head(Uri.parse(imageUrl));
        String? contentLengthHeader = response.headers['content-length'];
        int? contentLength = contentLengthHeader != null
            ? int.tryParse(contentLengthHeader)
            : null;

        if (contentLength != null) {
          // Example threshold, adjust as needed
          if (contentLength > 1024 * 1024) {
            selectedBoxFit = BoxFit.contain; // Large image, use BoxFit.contain
          } else {
            selectedBoxFit = BoxFit.cover; // Small image, use BoxFit.cover
          }
        }
      } catch (e) {
        print('Error getting image size: $e');
      }
    }
  }
}
