import 'package:flutter_base/di/usecases/home_use_case.dart';
import 'package:flutter_base/feature/home/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider =
    ChangeNotifierProvider.autoDispose<HomePageViewModel>(
  (ref) => HomePageViewModel(ref.read(homeUseCaseProvider)),
);
