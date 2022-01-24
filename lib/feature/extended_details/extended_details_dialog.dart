import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/feature/alert_dialog/alert_dialog_page_view.dart';
import 'package:flutter_base/ui/molecule/app_svg.dart';
import 'package:flutter_base/utils/asset_utils.dart';

class ExtendedDetailsDialog {
  ExtendedDetailsDialog._();

  static show(
    BuildContext context, {
    bool isScrollControlled: false,
    @required Widget Function(BuildContext context) builder,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Positioned(
                  right: 0.0,
                  left: 0.0,
                  top: 40,
                  bottom: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    // child:
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: builder(context),
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  top: 25,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppSvg.asset(AssetUtils.cancelIconCircle)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
