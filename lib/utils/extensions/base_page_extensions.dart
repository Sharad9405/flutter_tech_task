import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/ui/molecule/app_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension PageExtensions on BaseStatefulPage {
  showShortToast(String message) {
    AppToast.showToast(message, duration: Toast.LENGTH_SHORT);
  }

  showLongToast(String message) {
    AppToast.showToast(message, duration: Toast.LENGTH_LONG);
  }
}
