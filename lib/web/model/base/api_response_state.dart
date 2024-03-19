import 'package:demonewyorktimeapi/web/model/base/status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_response.dart';

// Define a class to hold the state of APIResponse
class APIResponseState<T> {
  APIResponse<T> value;

  APIResponseState(this.value);
}

// Create a StateProvider for APIResponseState
final loginResponseProvider = StateProvider<APIResponseState<dynamic>>((ref) {
  return APIResponseState(APIResponse<dynamic>(Status.LOADING, null, ""));
});