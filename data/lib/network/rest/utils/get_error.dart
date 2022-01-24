import 'package:data/entity/remote/error/error_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/network_error.dart';

NetworkError getError({Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final errorResponseEntity =
          ErrorResponseEntity.fromJson(apiResponse.data);
      if (errorResponseEntity != null) {
        return NetworkError(
            httpError: apiResponse.statusCode,
            message: errorResponseEntity.error.first,
            // message: errorResponseEntity.error.join(","),
            cause: Exception("Server Response Error"));
      } else {
        return NetworkError(
            httpError: apiResponse.statusCode,
            cause: Exception("Server Response Error"),
            message: apiResponse.statusMessage);
      }
    } catch (exception) {
      // exception.printStackTrace();
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode,
          message: apiResponse.statusMessage);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode,
        message: apiResponse.statusMessage);
  }
}
