import 'package:domain/constants/app_errors.dart';
import 'package:domain/error/base_app_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/base/base_page_view_model.dart';
import 'package:flutter_base/base/base_widget.dart';
import 'package:flutter_base/generated/l10n.dart';
import 'package:flutter_base/utils/extensions/base_page_extensions.dart';
import 'package:flutter_base/utils/parser/error_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BasePageViewModel> extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BasePageState<VM extends BasePageViewModel,
    T extends BasePage<VM>> extends State<T> {}

/// This class is three Baseclass for State class of the widget
abstract class BaseStatefulPage<VM extends BasePageViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VM _viewModel;

  bool get attached => _viewModel != null;

  @override
  Widget build(BuildContext context) {
    return _getLayout();
  }

  /// Returns viewModel of the screen
  VM getViewModel() {
    return attached
        ? _viewModel
        : throw BaseAppError(
            throwable: Exception("View model is not attached"),
            error: ErrorInfo(message: "View Model is not attached"),
            type: ErrorType.UI,
          );
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  /// Actual Screen which load scaffold and load UI
  Widget _getLayout() {
    return BaseWidget<VM>(
        providerBase: provideBase(),
        onModelReady: _onBaseModelReady,
        builder: (BuildContext context, VM model, Widget child) {
          return WillPopScope(
            onWillPop: onBackPressed,
            child: Scaffold(
              key: _scaffoldKey,
              appBar: buildAppbar(),
              resizeToAvoidBottomInset: false,
              extendBodyBehindAppBar: extendBodyBehindAppBar(),
              body: _buildScaffoldBody(context, model),
            ),
          );
        });
  }

  /// Building a appbar of screen
  Widget buildAppbar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  /// Body of the page which contains image in the background.
  Widget _buildScaffoldBody(BuildContext context, VM model) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      child: Stack(children: [
        Positioned.fill(
            child: Container(
          color: Colors.white,
        )),
        buildView(context, model)
      ]),
    );
  }

  /// All the children widget which extends this class should ovveride this
  /// method to provide Ui of the page
  @mustCallSuper
  Widget buildView(BuildContext context, VM model);

  void _onBaseModelReady(VM model) {
    _viewModel = model;
    model.error.listen((event) {
      showShortToast(
        ErrorParser.getLocalisedStringError(
          error: event,
          localisedHelper: S.of(context),
        ),
      );
    });
    model.toast.listen((message) {
      showShortToast(message);
    });
    onModelReady(model);
  }

  Future<bool> exitPage({dynamic param}) {
    return _onWillPop(param);
  }

  Future<bool> _onWillPop(dynamic param) {
    if (Navigator.canPop(context)) {
      if (param != null) {
        Navigator.pop(context, param);
      } else {
        Navigator.pop(
          context,
        );
      }
    }
    return Future.value(true);
  }

  Future<bool> onBackPressed() async {
    return true;
  }

  /*Mandatory*/

  /// You can setup load something when model is ready, Ex: Load or fetch some data from remote layer
  void onModelReady(VM model) {}

  /// Declare and initialization of viewModel for the page
  ProviderBase provideBase();
}

abstract class BasePageViewWidget<T extends BasePageViewModel> extends Widget {
  final ProviderBase providerBase;

  BasePageViewWidget(this.providerBase);

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() =>
      DataProviderElement<T>(this, this.providerBase);
}

class DataProviderElement<T extends BasePageViewModel>
    extends ComponentElement {
  final ProviderBase providerBase;

  DataProviderElement(BasePageViewWidget widget, this.providerBase)
      : super(widget);

  @override
  BasePageViewWidget get widget => super.widget;

  @override
  Widget build() {
    return BaseWidget<T>(
      providerBase: providerBase,
      builder: (context, model, child) {
        return widget.build(this, model);
      },
    );
  }
}
