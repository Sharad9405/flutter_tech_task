import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_utils.dart';

class StyleManager {
  StyleManager._();

  /// This is the style for the header green text of the app
  static TextStyle headerTextStyle = TextStyle(
      color: AppColor.grass, fontSize: 28.0, fontWeight: FontWeight.w800);

  /// This is the style for the general black text of the app. It is customizable by providing
  /// font weight and font size parameter.
  static TextStyle blackTextStyle(
      {FontWeight fontWeight = FontWeight.w400,
      double fontSize = 16.0,
      TextDecoration decoration}) {
    return TextStyle(
      color: AppColor.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  /// This is the style for disabling the text.
  static TextStyle greyTextStyle(
      {FontWeight fontWeight = FontWeight.w400,
      double fontSize = 16.0,
      TextDecoration decoration}) {
    return TextStyle(
      color: AppColor.coolGrey,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  /// This is the style for the general white text of the app.
  static TextStyle whiteTextStyle(
      {FontWeight fontWeight = FontWeight.w400,
      double fontSize = 16.0,
      double lineHeight,
      TextDecoration decoration}) {
    return TextStyle(
        color: AppColor.white,
        fontSize: fontSize,
        height: lineHeight,
        decoration: decoration,
        fontWeight: fontWeight);
  }

  /// This is the style for the general green text of the app.
  static TextStyle greenTextStyle(
      {FontWeight fontWeight = FontWeight.w400,
      double fontSize = 16.0,
      double lineHeight,
      TextDecoration decoration}) {
    return TextStyle(
        color: AppColor.grass,
        fontSize: fontSize,
        height: lineHeight,
        decoration: decoration,
        fontWeight: fontWeight);
  }

  /// This is the style for the general green text of the app.
  static TextStyle errorTextStyle(
      {FontWeight fontWeight = FontWeight.w700,
      double fontSize = 14.0,
      double lineHeight,
      TextDecoration decoration}) {
    return TextStyle(
        color: AppColor.orangeRed,
        fontSize: fontSize,
        height: lineHeight,
        decoration: decoration,
        fontWeight: fontWeight);
  }

  static InputBorder searchTextFieldBorderStyle() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ));
  }
}
