// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogs {
  static void logMessage(String tag, String key,String message) {
    final logger = Logger();
    if(kDebugMode){
      logger.d("$tag: $key : $message");
    }
  }
}