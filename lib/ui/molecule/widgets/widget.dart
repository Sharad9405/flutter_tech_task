import 'package:flutter/material.dart';
import 'package:flutter_base/utils/color_utils.dart';

Widget circularProgressIndicator() {
  return Center(
    child: Container(
      height: 50,
      width: 50,
      child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            AppColor.grass,
          ),
          strokeWidth: 4.0),
    ),
  );
}
