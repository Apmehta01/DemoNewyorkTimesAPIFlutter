
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AmountEditingController extends TextEditingController {
  @override

  TextSpan buildTextSpan({required BuildContext context, TextStyle? style, required bool withComposing}) {
    final originalText = text;
    final formattedText = formatAmount(originalText);
    return TextSpan(text: formattedText, style: style);
  }

  /*
  with Coma
  String formatAmount(String text) {
    // Remove non-digit characters from the input
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');

    // If the input is empty, return 0.00
    if (digits.isEmpty) {
      return '0.00';
    }

    // Parse the input as an integer and divide by 100 to get the decimal value
    final amount = int.parse(digits) / 100;

    // Format the decimal value with two decimal places
    final formattedAmount = amount.toStringAsFixed(2);

    // Add commas for thousands, millions, etc.
    final parts = formattedAmount.split('.');
    parts[0] = parts[0].replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');

    // Return the formatted amount
    return '${parts.join('.')}'.replaceAll(RegExp(r'^0+(?!\.|$)'), '');
  }*/
  String formatAmount(String text) {
    // Remove non-digit characters from the input
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');

    // If the input is empty, return 0.00
    if (digits.isEmpty) {
      return '0.00';
    }

    // Parse the input as an integer and divide by 100 to get the decimal value
    final amount = int.parse(digits) / 100;

    // Format the decimal value with two decimal places
    return amount.toStringAsFixed(2);
  }
}
