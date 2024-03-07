class AppException implements Exception {
  final _massage;
  final _prefix;
  AppException([this._massage, this._prefix]);
  String toString() {
    return '$_prefix$_massage';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'no Internet');
}

class RequestTimeout extends AppException {
  RequestTimeout([String? message]) : super(message, 'Request Timeout');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal Server Error');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class FatchDataException extends AppException {
  FatchDataException([String? message]) : super(message, '');
}
