import 'package:data/entity/remote/home/popular_movies_response_entity.dart';
import 'package:retrofit/retrofit.dart';

abstract class HomeRemoteDS {
  Future<HttpResponse<PopularMoviesResponseEntity>> getPopularMovies(
      {String type});
}
