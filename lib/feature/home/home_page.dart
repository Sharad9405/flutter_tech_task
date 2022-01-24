import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/di/home/home_module.dart';
import 'package:flutter_base/feature/home/home_page_view.dart';
import 'package:flutter_base/feature/home/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home Page for movies category
class HomePage extends BasePage<HomePageViewModel> {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulPage<HomePageViewModel, HomePage> {
  @override
  ProviderBase provideBase() => homeViewModelProvider;

  @override
  Widget buildView(BuildContext context, model) {
    return HomePageView(provideBase());
  }

}
