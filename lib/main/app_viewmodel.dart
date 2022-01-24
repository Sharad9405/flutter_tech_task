import 'package:domain/constants/enum/language_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/base/base_view_model.dart';
import 'package:flutter_base/utils/color_utils.dart';

GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');

class AppViewModel extends BaseViewModel {
  ThemeData _themeData = ThemeData();
  AppTheme _appTheme = AppTheme.light;

  AppTheme get appTheme => _appTheme;

  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  AppViewModel();

  void toggleLocale(LanguageEnum locale) {
    print("toggleLocale $locale");
    _currentLocale = Locale(locale.toString());
    notifyListeners();
  }

  ThemeData get themeData {
    // based on platform WidgetsBinding.instance.window.platformBrightness
    switch (_appTheme) {
      case AppTheme.dark:
        _themeData = _themeData.copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColor.white,
          accentColor: AppColor.darkBlueGrey,
          primaryColor: AppColor.grass,
          appBarTheme: AppBarTheme(color: AppColor.white, elevation: 0),
          primaryColorDark: AppColor.darkBlueGreen,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColor.grass,
            selectionHandleColor: AppColor.grass,
            selectionColor: AppColor.pinkishGreyTwo,
          ),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColor.pinkishGrey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              fillColor: AppColor.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColor.pinkishGrey, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColor.grass, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColor.orangeRed, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColor.orangeRed, width: 1)),
              errorStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColor.orangeRed,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 1,
              ),
              labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColor.greyishBrown,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.7,
              )),
          textTheme: _themeData.textTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          accentTextTheme: _themeData.accentTextTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          primaryTextTheme: _themeData.primaryTextTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          iconTheme: IconThemeData(
            color: AppColor.blackTwo,
          ),
          indicatorColor: AppColor.white,
          buttonTheme: ButtonThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            textTheme: ButtonTextTheme.normal,
          ),
        );
        break;
      case AppTheme.light:
        _themeData = _themeData.copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColor.white,
          accentColor: AppColor.darkBlueGrey,
          primaryColor: AppColor.grass,
          appBarTheme: AppBarTheme(color: AppColor.white, elevation: 0),
          primaryColorDark: AppColor.darkBlueGreen,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColor.grass,
            selectionHandleColor: AppColor.grass,
            selectionColor: AppColor.pinkishGreyTwo,
          ),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColor.pinkishGrey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
              fillColor: AppColor.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColor.pinkishGrey, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColor.grass, width: 1)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColor.orangeRed, width: 1)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: AppColor.orangeRed, width: 1)),
              errorStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColor.orangeRed,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: 1,
              ),
              labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColor.greyishBrown,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.7,
              )),
          textTheme: _themeData.textTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          accentTextTheme: _themeData.accentTextTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          primaryTextTheme: _themeData.primaryTextTheme.apply(
              fontFamily: 'Montserrat',
              bodyColor: AppColor.white,
              displayColor: AppColor.white),
          iconTheme: IconThemeData(
            color: AppColor.blackTwo,
          ),
          indicatorColor: AppColor.white,
          buttonTheme: ButtonThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            textTheme: ButtonTextTheme.normal,
          ),
        );
        break;
    }

    return _themeData;
  }

  ThemeData toggleTheme() {
    if (_appTheme == AppTheme.dark) {
      _appTheme = AppTheme.light;
    } else {
      _appTheme = AppTheme.dark;
    }
    return themeData;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

enum AppTheme {
  dark,
  light,
}
