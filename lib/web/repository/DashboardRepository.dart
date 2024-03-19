
import '../network/app_urls.dart';
import '../network/base/BaseApiService.dart';
import '../network/base/NetworkApiService.dart';

class DashboardRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> topStoriesApi(String apiKey) async {
    String? ak = apiKey;
    // Check if userName and password are not null, and provide default values if needed
    ak ??= '';

    try {
      final headers = {
        // 'Content-Type': 'application/json',
        'api-key':apiKey
      };

      dynamic response = await _apiServices.getAPIResponse(
          AppUrls.topStoriesAPI, headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> booksApi(String apiKey) async {
    String? ak = apiKey;
    // Check if userName and password are not null, and provide default values if needed
    ak ??= '';

    try {
      final headers = {
        // 'Content-Type': 'application/json',
        'api-key':apiKey
      };

      dynamic response = await _apiServices.getAPIResponse(
          AppUrls.booksAPI, headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}