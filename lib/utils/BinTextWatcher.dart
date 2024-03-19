
// ignore_for_file: file_names

import 'package:flutter/services.dart';

class BinTextWatcher implements TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String nonHyphenatedText = newValue.text.replaceAll("-", "");
    List<String> chunks = [];
    for (int i = 0; i < nonHyphenatedText.length; i += 4) {
      chunks.add(nonHyphenatedText.substring(
          i, (i + 4 < nonHyphenatedText.length) ? i + 4 : nonHyphenatedText.length));
    }

    String formattedText = chunks.join('-');
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
