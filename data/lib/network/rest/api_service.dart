import 'package:data/entity/remote/home/popular_movies_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

//flutter pub run build_runner build
@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET(
      "/3/movie/popular?api_key=671ea541a469d6ebded23881e9323133&language=en-US&page=1")
  Future<HttpResponse<PopularMoviesResponseEntity>> getPopularMovies();

  @GET(
      "/3/movie/top_rated?api_key=671ea541a469d6ebded23881e9323133&language=en-US&page=1")
  Future<HttpResponse<PopularMoviesResponseEntity>> getTopRatedMovies();

  @GET(
      "/3/movie/upcoming?api_key=671ea541a469d6ebded23881e9323133&language=en-US&page=1")
  Future<HttpResponse<PopularMoviesResponseEntity>> getUpcomingMovies();

  @GET(
      "/3/movie/latest?api_key=671ea541a469d6ebded23881e9323133&language=en-US&page=1")
  Future<HttpResponse<PopularMoviesResponseEntity>> getLatestMovies();
}
