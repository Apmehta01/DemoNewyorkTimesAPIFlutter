
import 'package:demonewyorktimeapi/riverpod/notifiers/BooksDataNotifier.dart';
import 'package:demonewyorktimeapi/riverpod/notifiers/TopStoriesDataNotifier.dart';
import 'package:demonewyorktimeapi/web/model/request/CommonRequest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../web/model/base/api_response.dart';
import '../../web/repository/DashboardRepository.dart';
String tag = "DashboardProviders";


final topStoriesApiProvider = FutureProvider.family<APIResponse, CommonRequest>(
      (ref, commonRequest) async {
    final repository = DashboardRepository();
    try {
      final response = await repository.topStoriesApi(commonRequest.apiKey.toString());
      return APIResponse.completed(response);
    } catch (e) {
      return APIResponse.error(e.toString());
    }
  },
);

final topStoriesDataProvider = ChangeNotifierProvider<TopStoriesDataNotifier>((ref) {
  return TopStoriesDataNotifier();
});

final booksApiProvider = FutureProvider.family<APIResponse, CommonRequest>(
      (ref, commonRequest) async {
    final repository = DashboardRepository();
    try {
      final response = await repository.booksApi(commonRequest.apiKey.toString());
      return APIResponse.completed(response);
    } catch (e) {
      return APIResponse.error(e.toString());
    }
  },
);


final booksDataProvider = ChangeNotifierProvider<BooksDataNotifier>((ref) {
  return BooksDataNotifier();
});

