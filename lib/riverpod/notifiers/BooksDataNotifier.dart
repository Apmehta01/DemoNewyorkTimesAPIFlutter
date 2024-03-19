import 'package:demonewyorktimeapi/web/model/response/booksdata/BooksData.dart';
import 'package:flutter/material.dart';

import '../../utils/AppLogs.dart';

String tag = "BooksDataNotifier";

class BooksDataNotifier extends ChangeNotifier {
  BooksData? _booksData;

  BooksData? get booksData => _booksData;

  void setBooksData(Map<String, dynamic> jsonData) {
    _booksData = BooksData.fromJson(jsonData);
    notifyListeners();
    AppLogs.logMessage(tag, 'Merchant Data Set:>>>>>>>', '$_booksData');

  }

  Map<String, dynamic>? get booksDataMap {
    if (_booksData != null) {
      return _booksData!.toJson();
    }
    return null;
  }
}
