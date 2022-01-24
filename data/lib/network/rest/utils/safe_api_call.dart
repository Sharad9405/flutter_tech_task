import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:data/network/rest/utils/get_error.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';
import 'package:retrofit/retrofit.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      print("original response $originalResponse");
      return Right(originalResponse);
    }
  } catch (throwable) {
    print(throwable.toString());
    switch (throwable.runtimeType) {
      case DioError:
        switch ((throwable).type) {
          case DioErrorType.CONNECT_TIMEOUT:
            //"Connection timeout with API server";
            break;
          case DioErrorType.SEND_TIMEOUT:
            //"Receive timeout exception";
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            //"Receive timeout in connection with API server";
            break;
          case DioErrorType.RESPONSE:
            if (throwable is DioError) {
              return Left(getError(apiResponse: throwable.response));
            }
            break;
          //"Received invalid status code: ${error.response.statusCode}";
          case DioErrorType.CANCEL:
            //"Request to API server was cancelled"
            break;
          case DioErrorType.DEFAULT:
            return Left(
              NetworkError(
                  message:
                      "Connection to API server failed due to internet connection",
                  httpError: 503,
                  cause: throwable),
            );
        }
        break;

      case IOException:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));

      case HttpException:
        var code = throwable.code();
        return Left(NetworkError(
            message: (throwable as HttpException).message,
            httpError: code,
            cause: throwable));

      default:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
  }
}

extension RetrofitResponse on HttpResponse {
  /**
   * Returns true if the code is in [200..300), which means the request was successfully received,
   * understood, and accepted.
   */
  bool isSuccessful() {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
