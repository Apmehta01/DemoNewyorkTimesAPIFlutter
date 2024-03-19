
// ignore_for_file: file_names

abstract class BaseApiServices{
  Future<dynamic> getAPIResponse(String url,Map<String, String> headers);
  Future<dynamic> postAPIResponse(String url, dynamic data,Map<String, String> headers);
}