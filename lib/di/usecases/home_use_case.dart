import 'package:data/di/repository_module.dart';
import 'package:domain/usecase/home/home_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeUseCaseProvider = Provider.autoDispose<HomeUseCase>(
  (ref) => HomeUseCase(
    ref.read(homeRepoProvider),
  ),
);
