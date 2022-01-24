import 'package:domain/model/home/popular_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/di/movie_details/movie_details_module.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page_view.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsPage extends BasePage<MovieDetailsPageViewModel> {
  final MovieDetailsPageArguments _arguments;

  MovieDetailsPage(this._arguments);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends BaseStatefulPage<MovieDetailsPageViewModel, MovieDetailsPage>
    with SingleTickerProviderStateMixin {


  @override
  ProviderBase provideBase() =>
      movieDetailsViewModelProvider?.call(widget._arguments);

  @override
  void onModelReady(MovieDetailsPageViewModel model) {
    super.onModelReady(model);
    model.tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget buildView(BuildContext context, model) {
    return MovieDetailsPageView(provideBase());
  }
}

class MovieDetailsPageArguments {
  final PopularMovies popularMovies;

  MovieDetailsPageArguments({this.popularMovies});
}
