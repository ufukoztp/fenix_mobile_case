import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fenix_mobile_case/core/base/enum/exception_type.dart';

sealed class Result<S, E extends AppException?> {
  const Result();
  static const String _jsonNodeError = 'isError';
  static const String _jsonNodeErrors = 'errors';
  static const String _result = 'result';
  static const String _message = 'message';
  static const String _statusCode = 'statusCode';
  static const int _universitySessionExpiredCode = 5;

  static Result<T, AppException> fromResponse<T>(
    Response? response,
    T Function(dynamic) mapper,
  ) {
    final responseData = response?.data;

    if (_checkHasError(responseData) || _checkErrorByStatusCode(response?.statusCode ?? 200)) {
      return Failure(AppException(
          message: _getErrorMessage(responseData[_message]),
          exceptionType: _handleExceptionType(
              response: response, responseData: responseData)));
    } else {
      if (responseData == null) {
        return Failure(AppException(
            message: _getErrorMessage(null),
            exceptionType: _handleExceptionType(
                response: response, responseData: responseData)));
      }
      final data = responseData;
      return Success(mapper(data));
    }
  }

  static bool _checkHasError(dynamic responseData) {
    bool isHasError = false;

    if (responseData == null ||
        responseData == '' ||
        responseData[_jsonNodeError] == true) {
      isHasError = true;
    }

    return isHasError;
  }

  static AppExceptionType _handleExceptionType(
      {dynamic responseData, required Response? response}) {
    if (_checkHasError(responseData) == false &&
        _checkErrorByStatusCode(response?.statusCode ?? 200) == false) {

      return AppExceptionType.SuccessButWithOutResponse;
    } else if (responseData[_statusCode] == HttpStatus.forbidden ) {
      return AppExceptionType.Exception;
    } else {
      return AppExceptionType.Exception;
    }
  }

  static bool _checkErrorByStatusCode(int statusCode) {
    switch (statusCode) {
      case >= 400 && < 600:
        return true;
      default:
        return false;
    }
  }
}

String _getErrorMessage(String? message) {
  return message ?? "Hata";
}

final class Success<S, E extends AppException> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends AppException> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}

class AppException implements Exception {
  final String message;
  final AppExceptionType exceptionType;

  AppException({required this.message, required this.exceptionType});
}
