import 'package:data/entity/remote/home/popular_movies_response_entity.dart';
import 'package:data/network/rest/api_service.dart';
import 'package:data/source/user/user_data_sources.dart';
import 'package:domain/constants/api_constant.dart';
import 'package:retrofit/dio.dart';

import '../home_data_source.dart';

class HomeRemoteDSImpl extends HomeRemoteDS {
  final ApiService _apiService;
  final UserLocalDS _userLocalDS;

  HomeRemoteDSImpl(this._apiService, this._userLocalDS);

  @override
  Future<HttpResponse<PopularMoviesResponseEntity>> getPopularMovies(
      {String type}) {
    if (type == ApiConstant.POPULAR) {
      return _apiService.getPopularMovies();
    } else if (type == ApiConstant.TOP_RATED) {
      return _apiService.getTopRatedMovies();
    } else if (type == ApiConstant.LATEST) {
      return _apiService.getLatestMovies();
    } else {
      return _apiService.getUpcomingMovies();
    }
  }
}
