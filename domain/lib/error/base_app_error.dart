import 'package:domain/constants/app_errors.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/foundation.dart';

class BaseAppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception throwable;

  BaseAppError({
    @required this.throwable,
    @required this.error,
    @required this.type,
  });
}
