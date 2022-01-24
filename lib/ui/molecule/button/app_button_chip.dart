import 'package:flutter/material.dart';
import 'package:flutter_base/utils/color_utils.dart';

class AppButtonChip extends StatelessWidget {
  final Function() onPressed;
  final String title;

  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final bool busy;
  final Color borderRadiusColor;
  final Color boxColor;
  final Color textColor;

  AppButtonChip(
      {Key key,
      @required this.onPressed,
      @required this.title,
      this.height: 40,
      this.width,
      this.margin,
      this.padding,
      this.fontSize: 16,
      this.busy: false,
      this.borderRadiusColor: AppColor.coolGrey,
      this.boxColor: AppColor.white,
      this.textColor: AppColor.coolGrey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: Container(
        alignment: Alignment.center,
        width: 95,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderRadiusColor, width: 1),
          color: boxColor,
        ),
        child: Text(title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            )),
        // ),
      ),
    );
  }
}
