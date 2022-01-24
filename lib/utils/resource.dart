import 'package:domain/error/base_app_error.dart';
import 'package:flutter_base/utils/status.dart';

class Resource<T> {
  final Status status;
  final T data;
  final BaseAppError baseAppError;

  Resource._({this.status, this.data, this.baseAppError});

  static Resource<T> success<T>({T data}) {
    return Resource<T>._(status: Status.SUCCESS, data: data);
  }

  static Resource<T> error<T>({T data, BaseAppError error}) {
    return Resource<T>._(status: Status.ERROR, data: data, baseAppError: error);
  }

  static Resource<T> loading<T>({T data}) {
    return Resource<T>._(
      data: data,
      status: Status.LOADING,
    );
  }

  static Resource<T> none<T>() {
    return Resource<T>._(
      data: null,
      status: Status.NONE,
    );
  }
}
