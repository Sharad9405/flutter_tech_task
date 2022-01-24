import 'package:data/di/local_module.dart';
import 'package:data/di/network_module.dart';
import 'package:data/repository/home/home_repositrory_impl.dart';
import 'package:data/repository/user/user_repository_impl.dart';
import 'package:domain/repository/home/home_repository.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:riverpod/riverpod.dart';

var userRepoProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(userRemoteDSProvider),
      ref.read(userLocalDSProvider), ref.read(dioProvider)),
);

var homeRepoProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(ref.read(homeRemoteDSProvider),
      ref.read(userRepoProvider), ref.read(dioProvider)),
);
