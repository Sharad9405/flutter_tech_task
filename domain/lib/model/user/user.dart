import 'package:domain/constants/enum/language_enum.dart';

class User {
  final String token;
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String dob;
  final bool isCurrent;
  final String countryCode;
  final LanguageEnum locale;
  bool isLoggedIn;
  String avatar;

  User({
    this.token,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.dob,
    this.countryCode,
    this.isCurrent,
    this.isLoggedIn: false,
    this.avatar,
    this.locale,
  });
}
