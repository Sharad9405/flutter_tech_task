import 'package:domain/constants/api_constant.dart';
import 'package:domain/model/home/movies.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:domain/usecase/home/home_use_case.dart';
import 'package:flutter_base/base/base_page_view_model.dart';
import 'package:flutter_base/utils/extensions/stream_extention.dart';
import 'package:flutter_base/utils/request_manager.dart';
import 'package:flutter_base/utils/resource.dart';
import 'package:flutter_base/utils/status.dart';
import 'package:rxdart/rxdart.dart';

/// ViewModel for logical and calculational part
class HomePageViewModel extends BasePageViewModel {
  final HomeUseCase _homeUseCase;

  final PublishSubject<HomeUseCaseParams> _popularMoviesRequest = PublishSubject();
  final PublishSubject<HomeUseCaseParams> _topRatedMoviesRequest = PublishSubject();
  final PublishSubject<HomeUseCaseParams> _upcomingMoviesRequest = PublishSubject();
  final PublishSubject<HomeUseCaseParams> _latestMoviesRequest = PublishSubject();
  final BehaviorSubject<List<Movies>> _moviesListResponse = BehaviorSubject.seeded([]);
  final BehaviorSubject<Resource<List<PopularMovies>>> _latestMoviesResponse = BehaviorSubject.seeded(Resource.loading());
  Stream<List<Movies>> get movieResponseStream => _moviesListResponse.stream;
  Stream<Resource<List<PopularMovies>>> get latestMoviesResponseStream => _latestMoviesResponse.stream;
  List<Movies> movieList = [];

  HomePageViewModel(this._homeUseCase) {
    _popularMoviesRequest.listen((value) {
      RequestManager(value,
              createCall: () => _homeUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        if (event.status == Status.SUCCESS) {
          /// consider only 5 item to test drag drop easily
          movieList.add(Movies(header: ApiConstant.POPULAR, movieList: event.data.take(5).toList()));
          _moviesListResponse.safeAdd(movieList);
        }
      });
    });
    _topRatedMoviesRequest.listen((value) {
      RequestManager(value, createCall: () => _homeUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        if (event.status == Status.SUCCESS) {
          /// consider only 5 item to test drag drop easily
          movieList.add(Movies(header: ApiConstant.TOP_RATED, movieList: event.data.take(5).toList()));
          _moviesListResponse.safeAdd(movieList);
        }
      });
    });
    _upcomingMoviesRequest.listen((value) {
      RequestManager(value, createCall: () => _homeUseCase.execute(params: value))
          .asFlow()
          .listen((event) async {
        _latestMoviesResponse.safeAdd(Resource.success(data: event.data));
        if (event.status == Status.SUCCESS) {
          /// consider only 5 item to test drag drop easily
          movieList.add(Movies(header: ApiConstant.UPCOMING, movieList: event.data.take(5).toList()));
          _moviesListResponse.safeAdd(movieList);
        }

      });
    });
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
  }
  getPopularMovies() {
    _popularMoviesRequest.safeAdd(HomeUseCaseParams(type: ApiConstant.POPULAR));
  }
  getTopRatedMovies() {
    _topRatedMoviesRequest.safeAdd(HomeUseCaseParams(type: ApiConstant.TOP_RATED));
  }
  getUpcomingMovies() {
    _upcomingMoviesRequest.safeAdd(HomeUseCaseParams(type: ApiConstant.UPCOMING));
  }
  void onItemReorder(
    int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    var movedItem = movieList[oldListIndex].movieList.removeAt(oldItemIndex);
    movieList[newListIndex].movieList.insert(newItemIndex, movedItem);
    _moviesListResponse.safeAdd(movieList);
  }

  void onListReorder(int oldListIndex, int newListIndex) {
    var movedList = movieList.removeAt(oldListIndex);
    movieList.insert(newListIndex, movedList);
    _moviesListResponse.safeAdd(movieList);
  }

  @override
  void dispose() {
    _popularMoviesRequest.close();
    _topRatedMoviesRequest.close();
    _upcomingMoviesRequest.close();
    _latestMoviesRequest.close();
    _moviesListResponse.close();
    _latestMoviesResponse.close();
    super.dispose();
  }
}
