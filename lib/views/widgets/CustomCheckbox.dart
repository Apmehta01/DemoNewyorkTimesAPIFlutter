import 'package:flutter/material.dart';

import '../../utils/AppLogs.dart';

const String tag = "CustomCheckbox";

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color checkColor;
  final double size;
  final String text;
  final Color textColor;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue,
    this.checkColor = Colors.white,
    this.size = 24.0,
    required this.text,
    required this.textColor,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.textAlign,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(isChecked);
          AppLogs.logMessage(tag, 'onChanged:>>>>>', '$isChecked');
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.activeColor,
                width: 2.0,
              ),
              color: isChecked ? widget.activeColor : Colors.transparent,
            ),
            child: isChecked
                ? Icon(
                    Icons.check,
                    size: widget.size * 0.7,
                    color: widget.checkColor,
                  )
                : null,
          ),
          const SizedBox(
              width: 8.0), // Adjust spacing between checkbox and text
          Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontFamily: widget.fontFamily,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
            textAlign: widget.textAlign,
          ),
        ],
      ),
    );
  }
}
