import 'package:flutter/foundation.dart';

class NetworkProperties {
  static const String BASE_URL = kReleaseMode
      ? "https://api.themoviedb.org"
      : "https://api.themoviedb.org";
}
