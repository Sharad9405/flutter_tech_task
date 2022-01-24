import 'package:data/network/rest/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/repository/user/user_repository.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final UserRepository _userRepository;
  final Dio _previousDio;
  ApiService apiService;

  ApiInterceptor(this._userRepository, this._previousDio) {
    Dio newDio = Dio(_previousDio.options);
    newDio.interceptors.add(_previousDio.interceptors.first);
    apiService = ApiService(
      newDio,
    );
  }

  @override
  Future onRequest(RequestOptions options) async {
    var userEither = await _userRepository.getCurrentUser();
    User user = userEither.fold((l) => null, (r) {
      return r;
    });
    options.headers.putIfAbsent("Authorization", () => "Bearer ${user?.token}");
    return options;
  }

  @override
  Future onError(DioError dioError) async {
    print("onError");
    return super.onError(dioError);
  }
}
