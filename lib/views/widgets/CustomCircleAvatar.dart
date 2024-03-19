// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleAvatar extends StatefulWidget {
  final String imageUrlOrXml;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;

  // New properties for CircleAvatar
  final double avatarRadius;
  final Color avatarBackgroundColor;

  const CustomCircleAvatar({
    Key? key,
    required this.imageUrlOrXml,
    this.width = 100.0,
    this.height = 100.0,
    this.fit = BoxFit.cover,
    this.color = Colors.black,
    // Initialize the new CircleAvatar properties
    this.avatarRadius = 80.0,
    this.avatarBackgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomCircleAvatar> {
  late Color currentColor;

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
    return Column(
      children: [
        // CircleAvatar with customizable properties
        CircleAvatar(
          radius: widget.avatarRadius,
          backgroundColor: widget.avatarBackgroundColor,
          child: GestureDetector(
            onTap: () {
              changeColor(Colors.red);
            },
            child: getImageWidget(),
          ),
        ),
        const SizedBox(height: 16), // Adjust spacing as needed
      ],
    );
  }

  Widget getImageWidget() {
    if (widget.imageUrlOrXml.toLowerCase().endsWith('.svg')) {
      if (widget.imageUrlOrXml.startsWith('<svg')) {
        return GestureDetector(
          onTap: () {
            changeColor(Colors.red);
          },
          child: SvgPicture.string(
            widget.imageUrlOrXml,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            color: currentColor,
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            changeColor(Colors.red);
          },
          child: SvgPicture.asset(
            widget.imageUrlOrXml,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            color: currentColor,
          ),
        );
      }
    } else {
      return GestureDetector(
        onTap: () {
          changeColor(Colors.red);
        },
        child: Image.asset(
          widget.imageUrlOrXml,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          // color: currentColor,
        ),
      );
    }
  }
}