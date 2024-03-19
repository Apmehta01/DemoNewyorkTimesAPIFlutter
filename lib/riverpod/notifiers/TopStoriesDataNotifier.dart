import 'package:flutter/material.dart';

import '../../utils/AppLogs.dart';
import '../../web/model/response/topstories/TopStoriesData.dart';

String tag = "TopStoriesDataNotifier";

class TopStoriesDataNotifier extends ChangeNotifier {
  TopStoriesData? _topStoriesData;

  TopStoriesData? get topStoriesData => _topStoriesData;

  void setTopStoriesData(Map<String, dynamic> jsonData) {
    _topStoriesData = TopStoriesData.fromJson(jsonData);
    notifyListeners();
    AppLogs.logMessage(tag, 'Merchant Data Set:>>>>>>>', '$_topStoriesData');

  }

  Map<String, dynamic>? get topStoriesDataMap {
    if (_topStoriesData != null) {
      return _topStoriesData!.toJson();
    }
    return null;
  }
}
