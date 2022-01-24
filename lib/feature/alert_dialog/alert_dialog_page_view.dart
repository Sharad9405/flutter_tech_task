import 'package:flutter/material.dart';

class AlertDialogPageView extends StatelessWidget {
  final bool isScrollControlled;

  @required
  Widget Function(BuildContext context) builder;

  AlertDialogPageView({
    this.isScrollControlled: false,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: isScrollControlled,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: builder(context),
    );
  }
}
