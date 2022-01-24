import 'package:dartz/dartz.dart';
import 'package:domain/constants/app_errors.dart';
import 'package:domain/error/base_app_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:domain/repository/home/home_repository.dart';
import 'package:domain/usecase/base/base_usecase.dart';
import 'package:domain/usecase/base/params.dart';
import 'package:domain/utils/validator.dart';

/// User case for home page
class HomeUseCase
    extends BaseUseCase<NetworkError, HomeUseCaseParams, List<PopularMovies>> {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<NetworkError, List<PopularMovies>>> execute(
      {HomeUseCaseParams params}) {
    return _repository.getPopularMovies(type: params.type);
  }
}

class HomeUseCaseParams extends Params {
  final String type;

  HomeUseCaseParams({this.type});

  @override
  Either<BaseAppError, bool> verify() {
    if (type == null || Validator.isEmpty(type)) {
      return Left(BaseAppError(
          type: ErrorType.EMPTY_MOVIE_TYPE,
          throwable: Exception(),
          error: ErrorInfo(message: '')));
    }
    return Right(true);
  }
}
