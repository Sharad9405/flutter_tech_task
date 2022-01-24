import 'package:dartz/dartz.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/home/popular_movies.dart';

/// Repository for home module
abstract class HomeRepository {
  Future<Either<NetworkError, List<PopularMovies>>> getPopularMovies(
      {String type});
}
