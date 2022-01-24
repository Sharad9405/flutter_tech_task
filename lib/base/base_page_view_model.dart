import 'package:domain/error/base_app_error.dart';
import 'package:flutter_base/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class BasePageViewModel extends BaseViewModel {
  PublishSubject<BaseAppError> _error = PublishSubject<BaseAppError>();
  PublishSubject<String> _toast = PublishSubject<String>();

  BasePageViewModel();

  Stream<BaseAppError> get error => _error.stream;

  Stream<String> get toast => _toast.stream;

  void showToastWithError(BaseAppError error) {
    _error.sink.add(error);
  }

  void showToastWithString(String message) {
    _toast.sink.add(message);
  }

  @override
  void dispose() {
    _error.close();
    _toast.close();
    super.dispose();
  }
}
