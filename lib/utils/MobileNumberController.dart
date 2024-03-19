// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'AppStrings.dart';

class MobileNumberController extends TextEditingController {
  MobileNumberController();

  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final originalText = text;
    return TextSpan(text: originalText, style: style);
  }

  @override
  set text(String newText) {
    // Validate the new text (assuming 9 digits are required)
    if (newText.length <= 9) {
      super.text = newText;
    }
  }

  void addPrefix() {
    if (text.isEmpty) {
      super.text = AppStrings.STR_UAE_MOBILE_PREFIX_WITH_SPACE; // Add +971 prefix when text is empty
    }
  }

  void removePrefix() {
    if (text == AppStrings.STR_UAE_MOBILE_PREFIX) {
      super.text = ''; // Remove +971 prefix when text is only the prefix
    }
  }
}
