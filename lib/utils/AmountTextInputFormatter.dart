

// ignore_for_file: file_names

import 'package:flutter/services.dart';

class AmountTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Implement any additional formatting logic here if needed
    return newValue;
  }
}