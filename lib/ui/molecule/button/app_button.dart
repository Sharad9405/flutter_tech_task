import 'package:flutter/material.dart';
import 'package:flutter_base/utils/color_utils.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final bool busy;

  AppButton({
    Key key,
    @required this.onPressed,
    @required this.title,
    this.height: 59,
    // this.width: 315,
    this.width,
    this.margin,
    this.padding,
    this.fontSize: 16,
    this.busy: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        child: Container(
          height: height,
          width: width,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                onTap: () {
                  FocusScope.of(context).unfocus();
                  this.onPressed?.call();
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppColor.grass,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: busy
                        ? Container(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  Theme.of(context).indicatorColor,
                                ),
                                strokeWidth: 2.0),
                          )
                        : Text(title,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                            )),
                  ),
                )),
          ),
        ));
  }
}
