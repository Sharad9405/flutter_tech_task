import 'package:domain/constants/app_constant.dart';

class StringUtil {
  StringUtil._();

  /// get capitalized word
  static String getCapitalizedWord(String inputString) {
    if (inputString.isNotEmpty) {
      return "${inputString[0].toUpperCase()}${inputString.substring(1)}";
    }
    return "";
  }

  static getImageUrlOriginal(String path) {
    return '${Constant.BASE_IMAGE_URL_ORIGINAL}$path';
  }

  static getImageUrl500(String path) {
    return '${Constant.BASE_IMAGE_URL_500}$path';
  }
}
