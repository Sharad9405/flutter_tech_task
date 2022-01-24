import 'package:dartz/dartz.dart';
import 'package:domain/error/base_app_error.dart';

abstract class Params {
  Either<BaseAppError, bool> verify();
}
