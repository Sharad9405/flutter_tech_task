import 'package:domain/model/home/popular_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/di/movie_details/movie_details_module.dart';
import 'package:flutter_base/feature/extended_details/extended_details_page_view.dart';
import 'package:flutter_base/feature/extended_details/extended_details_page_viewmodel.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page_view.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExtendedDetailsPage extends BasePage<ExtendedDetailsPageViewModel> {
  final ExtendedDetailsPageArguments _arguments;

  ExtendedDetailsPage(this._arguments);

  @override
  _ExtendedDetailsPageState createState() => _ExtendedDetailsPageState();
}

class _ExtendedDetailsPageState extends BaseStatefulPage<ExtendedDetailsPageViewModel, ExtendedDetailsPage>
    with SingleTickerProviderStateMixin {


  @override
  ProviderBase provideBase() =>
      extendedDetailsViewModelProvider?.call(widget._arguments);

  @override
  void onModelReady(ExtendedDetailsPageViewModel model) {
    super.onModelReady(model);
    model.tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget buildView(BuildContext context, model) {
    return ExtendedDetailsPageView(provideBase());
  }
}

class ExtendedDetailsPageArguments {
  final PopularMovies popularMovies;

  ExtendedDetailsPageArguments({this.popularMovies});
}
