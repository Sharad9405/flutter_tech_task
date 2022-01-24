import 'package:domain/constants/app_errors.dart';
import 'package:domain/error/base_app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/foundation.dart';

class NetworkError extends BaseError {
  NetworkError({
    @required int httpError,
    String message: "",
    @required Exception cause,
  }) : super(error: ErrorInfo(code: httpError, message: message), cause: cause);

  @override
  String getFriendlyMessage() {
    return "${this.error.message}";
  }

  @override
  BaseAppError transform() {
    switch (error.code) {
      case 503:
        return BaseAppError(
            error: error,
            throwable: cause,
            type: ErrorType.NET_NO_INTERNET_CONNECTION);

      case 504:
        return BaseAppError(
            throwable: cause, error: error, type: ErrorType.NET_SERVER_MESSAGE);

      case 502:
        return BaseAppError(
            throwable: cause, error: error, type: ErrorType.NET_SERVER_MESSAGE);

      case 404:
        return BaseAppError(
            throwable: cause, error: error, type: ErrorType.NET_SERVER_MESSAGE);

      default:
        return BaseAppError(
            throwable: cause, error: error, type: ErrorType.NETWORK);
    }
  }
}
