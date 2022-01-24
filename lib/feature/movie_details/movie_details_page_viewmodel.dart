import 'package:domain/constants/api_constant.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:domain/usecase/home/home_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page_view_model.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page.dart';
import 'package:flutter_base/utils/extensions/stream_extention.dart';
import 'package:flutter_base/utils/request_manager.dart';
import 'package:flutter_base/utils/resource.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsPageViewModel extends BasePageViewModel {
  final HomeUseCase _homeUseCase;
  final MovieDetailsPageArguments _movieDetailsPageArguments;
  TabController tabController;

  MovieDetailsPageArguments get movieDetailsArguments => _movieDetailsPageArguments;

  final PublishSubject<HomeUseCaseParams> _similarMoviesRequest = PublishSubject();
  final PublishSubject<HomeUseCaseParams> _topRatedMoviesRequest = PublishSubject();
  final PublishSubject<HomeUseCaseParams> _upcomingMoviesRequest = PublishSubject();
  final PublishSubject<HomeUseCaseParams> _latestMoviesRequest = PublishSubject();

  final BehaviorSubject<Resource<List<PopularMovies>>> _popularMoviesResponse = BehaviorSubject.seeded(Resource.loading());

  Stream<Resource<List<PopularMovies>>> get similarMoviesResponseStream => _popularMoviesResponse.stream;

  MovieDetailsPageViewModel(
      this._homeUseCase, this._movieDetailsPageArguments) {
    _similarMoviesRequest.listen((value) {
      RequestManager(value, createCall: () => _homeUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        _popularMoviesResponse.safeAdd(event);
      });
    });
    getSimilarMovies();
  }

  getSimilarMovies() {
    _similarMoviesRequest.safeAdd(HomeUseCaseParams(type: ApiConstant.POPULAR));
  }

  List<String> getImageList(List<PopularMovies> data) {
    List<String> list = [];
    data.forEach((element) {
      (element.posterPath != null)
          ? list.add(element.posterPath)
          : (element.backdropPath != null)
              ? list.add(element.backdropPath)
              : list.add('');
    });
    return list;
  }

  @override
  void dispose() {
    _similarMoviesRequest.close();
    _topRatedMoviesRequest.close();
    _upcomingMoviesRequest.close();
    _latestMoviesRequest.close();
    _popularMoviesResponse.close();
    super.dispose();
  }
}
