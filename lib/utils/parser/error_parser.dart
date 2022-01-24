import 'package:domain/constants/app_errors.dart';
import 'package:domain/error/base_app_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/generated/l10n.dart';

class ErrorParser {
  ErrorParser._();

  static String getLocalisedStringError(
      {@required BaseAppError error, @required S localisedHelper}) {
    if (error == null || error.type == null) return "";
    switch (error.type) {
      case ErrorType.IOEXCEPTION:
        return localisedHelper.appName;
      case ErrorType.NETWORK:
        return error.error.message;
      case ErrorType.NET_SERVER_MESSAGE:
        return localisedHelper.unexpectedError;
      case ErrorType.NET_NO_INTERNET_CONNECTION:
        return localisedHelper.appName;
      case ErrorType.UI:
        return localisedHelper.appName;
      case ErrorType.NO_BIO_METRIC_SUPPORT:
        // TODO: Handle this case.
        break;
      case ErrorType.NET_WRONG_VERIFICATION_CODE:
        // TODO: Handle this case.
        break;
      case ErrorType.NET_ACCOUNT_ALREADY_EXIST:
        // TODO: Handle this case.
        break;
      case ErrorType.NET_ACCOUNT_NOT_VERIFIED:
        // TODO: Handle this case.
        break;
      case ErrorType.NET_INVALID_CREDENTIAL:
        // TODO: Handle this case.
        break;
      case ErrorType.NET_OTP_EXPIRED:
        // TODO: Handle this case.
        break;
      case ErrorType.EMPTY_EMAIL:
        return "Empty EMAIL";
        break;
      case ErrorType.EMPTY_PHONE:
        return "Empty PHONE";
        break;
      case ErrorType.INVALID_EMAIL:
        return "INVALID EMAIL";
        break;
      case ErrorType.INVALID_PHONE:
        return "INVALID PHONE";
        break;
      case ErrorType.EMPTY_PASSWORD:
        return "EMPTY PASSWORD";
        break;
      case ErrorType.PASSWORD_NOT_MATCHED:
        return "PASSWORD NOT MATCHED";
        break;
      case ErrorType.DATABASE:
        // TODO: Handle this case.
        break;
      case ErrorType.DATABASE_NOT_SUPPORTED:
        // TODO: Handle this case.
        break;
      case ErrorType.DB_ERROR1:
        // TODO: Handle this case.
        break;
      case ErrorType.DB_USER_NOT_FOUND:
        // TODO: Handle this case.
        break;

      default:
        return "";
    }
  }
}
