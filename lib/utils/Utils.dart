// ignore_for_file: unnecessary_null_comparison, slash_for_doc_comments, file_names

import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  /**
   * Name: [Utils] isNumeric()
   * <br> Created By Arpan Mehta on 15-05-24
   * <br> Modified By Arpan Mehta on 15-05-24
   * <br> Purpose: This method will check given string is numeric or not.
   * @param s string.
   */
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  /**
  * Name: [Utils] isNumeric()
  * <br> Created By Arpan Mehta on 15-05-24
  * <br> Modified By Arpan Mehta on 15-05-24
  * <br> Purpose: This method format amount add decimal point.
  * @param text string.
  */

  static String formatAmount(String text) {
    // Remove non-digit characters from the input
    final digits = text.replaceAll(RegExp(r'[^\d]'), '');

    // If the input is empty, return '0.00'
    if (digits.isEmpty) {
      return '0.00';
    }

    // Parse the input as an integer and divide by 100 to get the decimal value
    final amount = int.parse(digits) / 100;

    // Create a NumberFormat instance for currency formatting
    NumberFormat currencyFormat =
        NumberFormat.currency(symbol: '', decimalDigits: 2);

    // Format the decimal value with commas and two decimal places
    return currencyFormat.format(amount);
  }

  /**
  * Name: [Utils] extractNumbers()
  * <br> Created By Arpan Mehta on 15-05-24
  * <br> Modified By Arpan Mehta on 15-05-24
  * <br> Purpose: This method will extract Numbers from given string.
  * @param input string.
  */

  static String extractNumbers(String input) {
    RegExp regex = RegExp(r'\d+');
    Iterable<Match> matches = regex.allMatches(input);
    StringBuffer result = StringBuffer();

    for (Match match in matches) {
      result.write(match.group(0));
    }

    return result.toString();
  }

  /**
  * Name: [Utils] getCountries()
  * <br> Created By Arpan Mehta on 15-05-24
  * <br> Modified By Arpan Mehta on 15-05-24
  * <br> Purpose: This method will get country list to be displaed on mobile numbr input text field.
  */

  static List<Country> getCountries() {
    return [
      const Country(
        name: "United Arab Emirates",
        nameTranslations: {
          "sk": "Spojené arabské emiráty",
          "se": "Ovttastuvvan Arábaemiráhtat",
          "pl": "Zjednoczone Emiraty Arabskie",
          "no": "De forente arabiske emirater",
          "ja": "アラブ首長国連邦",
          "it": "Emirati Arabi Uniti",
          "zh": "阿拉伯联合酋长国",
          "nl": "Verenigde Arabische Emiraten",
          "de": "Vereinigte Arabische Emirate",
          "fr": "Émirats arabes unis",
          "es": "Emiratos Árabes Unidos",
          "en": "United Arab Emirates",
          "pt_BR": "Emirados Árabes Unidos",
          "sr-Cyrl": "Уједињени Арапски Емирати",
          "sr-Latn": "Ujedinjeni Arapski Emirati",
          "zh_TW": "阿拉伯聯合大公國",
          "tr": "Birleşik Arap Emirlikleri",
          "ro": "Emiratele Arabe Unite",
          "ar": "الإمارات العربية المتحدة",
          "fa": "امارات متحده عربی",
          "yue": "阿拉伯聯合酋長國"
        },
        flag: "🇦🇪",
        code: "AE",
        dialCode: "971",
        minLength: 9,
        maxLength: 9,
      ),
    ];
  }

  static Future<void> launchPhone(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static void launchEmail(String email) async {
    String url = '$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchMaps(double latitude, double longitude) async {
    String url = 'geo:$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String formatDate(DateTime date) {
    // Format the date as dd-mm-yyyy
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  /* static Map<String, dynamic>? convertObjectToMap<T extends JsonSerializable>(T? object) {
    return object?.toJson();
  }*/

  static String prettyPrintJsonRequest(Map<String, dynamic> jsonMap) {
    return const JsonEncoder.withIndent('    ').convert(jsonMap);
  }

  static String prettyPrintJsonResponse(Map<String, dynamic> jsonMap) {
    return const JsonEncoder.withIndent('  ').convert(jsonMap);
  }

  static Future<File> getFileFromPath(String filePath) async {
    return File(filePath);
  }

 static String formatDateAndTime(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('dd-MMMM-yyyy hh mm ss a').format(dateTime);
    return formattedDate;
  }
}
