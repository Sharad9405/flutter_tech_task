import 'package:flutter/foundation.dart';

class DbLocalException implements Exception {
  final DbLocalExceptionType dbExceptionType;

  DbLocalException({@required this.dbExceptionType});
}

class DbLocalExceptionType {
  final int _value;

  const DbLocalExceptionType._(this._value);

  int get value => this._value;

  static const DbLocalExceptionType NO_USER_FOUND =
      DbLocalExceptionType._(2);
  static const DbLocalExceptionType NO_BIO_METRIC_SUPPORT =
      DbLocalExceptionType._(3);
  static const DbLocalExceptionType BIO_METRIC_FAIL =
      DbLocalExceptionType._(4);
  static const DbLocalExceptionType NOTIFICATION_FAILED =
      DbLocalExceptionType._(4);
}
