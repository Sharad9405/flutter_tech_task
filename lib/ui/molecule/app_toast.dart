import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_base/utils/color_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  AppToast._();

  static showToast(
    String message, {
    Color backgroundColor: AppColor.pinkishGrey,
    Toast duration: Toast.LENGTH_LONG,
    Color textColor: AppColor.white,
    ToastGravity gravity: ToastGravity.BOTTOM,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration,
      gravity: gravity,
      backgroundColor: backgroundColor,
      timeInSecForIosWeb: 3,
      textColor: textColor,
      fontSize: 14,
    );
  }
}
