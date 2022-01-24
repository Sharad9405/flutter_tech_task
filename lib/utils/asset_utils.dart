import 'package:flutter/material.dart';

/// assets utility class
class AssetUtils {
  AssetUtils._();

  static const String _svg = "asset/svg/";
  static const String background = _svg + "background.svg";
  static const String cancelIconCircle = _svg + "cancel_icon_circle.svg";
  static const String profile = _svg + "profile.svg";

  /// load assets
  static loadAsset(String path) {
    return AssetImage(path);
  }
}
