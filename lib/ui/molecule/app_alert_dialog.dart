import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/feature/alert_dialog/alert_dialog_page_view.dart';

class AppAlertDialog {
  AppAlertDialog._();

  static show(
    BuildContext context, {
    bool isScrollControlled: false,
    @required Widget Function(BuildContext context) builder,
  }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialogPageView(
            isScrollControlled: isScrollControlled,
            builder: builder,
          );
        });
  }
}
