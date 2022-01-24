import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/base/base_widget.dart';
import 'package:flutter_base/di/app/app_modules.dart';
import 'package:flutter_base/generated/l10n.dart';
import 'package:flutter_base/main/app_viewmodel.dart';
import 'package:flutter_base/main/navigation/app_router.dart';
import 'package:flutter_base/main/navigation/route_paths.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends ConsumerWidget {
  AppViewModel _appViewModel;

  @override
  Widget build(BuildContext context, watch) {
    return BaseWidget<AppViewModel>(
        providerBase: appViewModel,
        onModelReady: (model) {
          _appViewModel = watch(appViewModel);
          //   WidgetsBinding.instance.addObserver(this);
        },
        builder: (context, appModel, child) {
          return MaterialApp(
              navigatorKey: appLevelKey,
              builder: (context, widget) => ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, widget),
                    maxWidth: 1400,
                    minWidth: 375,
                    defaultScale: true,
                    breakpoints: [
                      ResponsiveBreakpoint.resize(375, name: MOBILE),
                      ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                      ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                      ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                    ],
                  ),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              locale: _appViewModel.currentLocale,
              supportedLocales: S.delegate.supportedLocales,
              onGenerateTitle: (context) => S.of(context).appName,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutePaths.Home,
              theme: _appViewModel.themeData,
              onGenerateRoute: AppRouter.generateRoute);
        });
  }
}
