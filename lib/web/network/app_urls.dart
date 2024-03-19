import 'package:flutter/foundation.dart';

import '../../utils/Constants.dart';

class AppUrls {
  static String get baseURLLOCAL {
    if (kDebugMode) {
      return 'https://api.nytimes.com/svc/';
    } else {
      return 'https://api.nytimes.com/svc/';
    }
  }

  static var topStoriesAPI = baseURLLOCAL + Constants.STR_TOP_STORIES_API;
  static var booksAPI = baseURLLOCAL + Constants.STR_BOOKS_API;

}
