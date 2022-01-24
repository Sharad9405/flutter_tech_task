import 'package:domain/error/base_app_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:flutter/foundation.dart';

abstract class BaseError
    extends BaseLayerDataTransformer<BaseError, BaseAppError>
    implements Exception {
  final ErrorInfo error;
  final Exception cause;

  BaseError({@required this.error, @required this.cause});

  String getFriendlyMessage();

  logError() {}
}
