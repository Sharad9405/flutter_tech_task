import 'package:flutter_base/main/app_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider<AppViewModel> appViewModel =
    ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(),
);
