import '../../utils/AppStrings.dart';

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, AppStrings.CONNECTION_TIMEOUT);
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, AppStrings.BAD_REQUEST_EXCEPTION);
}

class UnAuthorizeException extends AppException {
  UnAuthorizeException([String? message])
      : super(message, AppStrings.TOKEN_EXPIRE);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, AppStrings.INVALID_INPUT);
}
