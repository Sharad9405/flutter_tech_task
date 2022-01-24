import 'package:data/di/local_module.dart';
import 'package:data/network/rest/api_service.dart';
import 'package:data/network/rest/network_properties.dart';
import 'package:data/source/home/home_data_source.dart';
import 'package:data/source/home/remote/home_remote_ds_impl.dart';
import 'package:data/source/user/remote/user_remote_ds_impl.dart';
import 'package:data/source/user/user_data_sources.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod/riverpod.dart';

final baseOptions = Provider<BaseOptions>(
    (ref) => BaseOptions(baseUrl: NetworkProperties.BASE_URL));

final prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (ref) => PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(log);
    },
  ),
);

final dioProvider = Provider<Dio>(
  (ref) {
    Dio dio = Dio(ref.read(baseOptions));
    dio.interceptors.add(
      ref.read(prettyDioLoggerProvider),
    );
    return dio;
  },
);

final apiServiceProvider = Provider<ApiService>(
  (ref) =>
      ApiService(ref.read(dioProvider), baseUrl: NetworkProperties.BASE_URL),
);

final userRemoteDSProvider = Provider<UserRemoteDS>(
    (ref) => UserRemoteDSImpl(ref.read(apiServiceProvider)));

final homeRemoteDSProvider = Provider<HomeRemoteDS>((ref) => HomeRemoteDSImpl(
    ref.read(apiServiceProvider), ref.read(userLocalDSProvider)));
