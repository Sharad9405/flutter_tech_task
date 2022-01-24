import 'package:domain/constants/app_errors.dart';
import 'package:domain/error/base_app_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/foundation.dart';

import 'base_error.dart';

class LocalError extends BaseError {
  LocalError({
    @required String message,
    @required int localError,
    @required Exception cause,
  }) : super(
            error: ErrorInfo(message: message, code: localError), cause: cause);

  @override
  String getFriendlyMessage() {
    return "${error.message}";
  }

  @override
  BaseAppError transform() {
    switch (error.code) {
      case 1:
        return BaseAppError(
            error: error,
            throwable: cause,
            type: ErrorType.NO_BIO_METRIC_SUPPORT);
      default:
        return BaseAppError(
            error: error, throwable: cause, type: ErrorType.IOEXCEPTION);
    }
  }
}
