// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../utils/AppLogs.dart';
import '../../../utils/AppStrings.dart';
import '../app_exceptions.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiServices {
  final String tag = "NetworkApiService";

  @override
  Future getAPIResponse(String url, Map<String, String> headers) async {
    dynamic responseJson;
    final requestHeaders = headers.isNotEmpty ? headers : null;
    String apiKey = headers['api-key'] ?? '';

    if (requestHeaders!.isNotEmpty) {
      url += '?api-key=$apiKey';
      AppLogs.logMessage(tag, 'HEADERS:>>>>>>>>', '$requestHeaders');
      AppLogs.logMessage(tag, 'URL:>>>>>>>>', url);
      try {
        final response = await http
            .get(Uri.parse(url), headers: requestHeaders)
            .timeout(const Duration(seconds: 10));
        responseJson = returnResponse(response);
        AppLogs.logMessage(
            tag, 'STATUS CODE:>>>>>>>>', '${response.statusCode}');
        // AppLogs.logMessage(tag, 'RESPONSE BODY:>>>>>>>', '$responseJson');
      } on TimeoutException {
        throw FetchDataException(AppStrings.STR_REQUEST_TIME_OUT);
      } on SocketException {
        AppLogs.logMessage(tag, AppStrings.INTERNET_ISSUE, url);
        throw FetchDataException(AppStrings.INTERNET_ISSUE);
      } on HttpException catch (e) {
        AppLogs.logMessage(tag, AppStrings.STR_SERVER_NOT_RESPONDING, url);
        throw FetchDataException(AppStrings.STR_SERVER_NOT_RESPONDING);
      } on FormatException catch (e) {
        AppLogs.logMessage(tag, AppStrings.STR_INCORRECT_RESPONSE_FORMAT, url);
        throw FetchDataException(AppStrings.STR_INCORRECT_RESPONSE_FORMAT);
      } catch (e) {
        AppLogs.logMessage(tag, AppStrings.STR_UNEXPECTED_ERROR, url);
        throw FetchDataException(AppStrings.STR_UNEXPECTED_ERROR);
      }
    } else {
      try {
        // AppLogs.logMessage(tag, 'URL:>>>>>>>>', url);
        final response = await http
            .get(Uri.parse(url))
            .timeout(const Duration(seconds: 30));
        responseJson = returnResponse(response);
      } on TimeoutException {
        throw FetchDataException(AppStrings.STR_REQUEST_TIME_OUT);
      } on SocketException {
        AppLogs.logMessage(tag, AppStrings.INTERNET_ISSUE, url);
        throw FetchDataException(AppStrings.INTERNET_ISSUE);
      } on HttpException catch (e) {
        AppLogs.logMessage(tag, AppStrings.STR_SERVER_NOT_RESPONDING, url);
        throw FetchDataException(AppStrings.STR_SERVER_NOT_RESPONDING);
      } on FormatException catch (e) {
        AppLogs.logMessage(tag, AppStrings.STR_INCORRECT_RESPONSE_FORMAT, url);
        throw FetchDataException(AppStrings.STR_INCORRECT_RESPONSE_FORMAT);
      } catch (e) {
        AppLogs.logMessage(tag, AppStrings.STR_UNEXPECTED_ERROR, url);
        throw FetchDataException(AppStrings.STR_UNEXPECTED_ERROR);
      }
    }
    return responseJson;
  }

  @override
  Future postAPIResponse(
      String url, dynamic data, Map<String, String> headers) async {
    dynamic responseJson;

    try {
      AppLogs.logMessage(tag, 'URL:>>>>>>>>', url);

      // Log the request data
      AppLogs.logMessage(tag, 'REQUEST BODY:>>>>>>>', jsonEncode(data));

      final requestData = data.toJson();
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(requestData), headers: headers)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      AppLogs.logMessage(tag, 'STATUS CODE:>>>>>>>>', '${response.statusCode}');
      // AppLogs.logMessage(tag, 'RESPONSE BODY:>>>>>>>', '$responseJson');
    } on TimeoutException {
      throw FetchDataException(AppStrings.STR_REQUEST_TIME_OUT);
    } on SocketException {
      AppLogs.logMessage(tag, AppStrings.INTERNET_ISSUE, url);
      throw FetchDataException(AppStrings.INTERNET_ISSUE);
    } on HttpException catch (e) {
      throw FetchDataException(AppStrings.STR_SERVER_NOT_RESPONDING);
    } on FormatException catch (e) {
      throw FetchDataException(AppStrings.STR_INCORRECT_RESPONSE_FORMAT);
    } catch (e) {
      throw FetchDataException(AppStrings.STR_UNEXPECTED_ERROR);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        // Handle 404 error specifically for the given response format
        try {
          dynamic responseJson = jsonDecode(response.body);
          // Check if the response contains a valid JSON object
          if (responseJson is Map<String, dynamic> &&
              responseJson.containsKey('status') &&
              responseJson.containsKey('message') &&
              responseJson.containsKey('error')) {
            // Handle the response here
            // For example, return a custom error object
            return responseJson;
          } else {
            // Invalid response format, throw an exception or handle as needed
            throw FetchDataException(
                'Invalid response format: ${response.body}');
          }
        } catch (e) {
          // JSON decoding error, throw an exception or handle as needed
          throw FetchDataException('Error decoding JSON: ${response.body}');
        }
      default:
        throw FetchDataException(
            AppStrings.SERVER_NOT_REACHABLE + response.statusCode.toString());
    }
  }
}
