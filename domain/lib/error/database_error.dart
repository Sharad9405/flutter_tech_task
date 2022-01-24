import 'package:domain/constants/app_errors.dart';
import 'package:domain/error/base_app_error.dart';
import 'package:domain/error/base_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/foundation.dart';

class DatabaseError extends BaseError {
  DatabaseError({
    @required String message,
    @required int databaseError,
    @required Exception cause,
  }) : super(
            error: ErrorInfo(message: message, code: databaseError),
            cause: cause);

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
            type: ErrorType.DATABASE_NOT_SUPPORTED);
      case 2:
        return BaseAppError(
            error: error, throwable: cause, type: ErrorType.DB_USER_NOT_FOUND);
      default:
        return BaseAppError(
            error: error, throwable: cause, type: ErrorType.DATABASE);
    }
  }
}
