import 'package:data/db/floor/constants/database_tables.dart';
import 'package:domain/constants/enum/language_enum.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:floor/floor.dart';

@Entity(tableName: Table.USER, indices: [
  Index(value: ['email'], unique: true)
])
class UserDBEntity extends BaseLayerDataTransformer<UserDBEntity, User> {
  @primaryKey
  int id;
  String email;
  String firstName;
  String lastName;
  String mobile;
  bool isCurrent;
  String token;
  String dob;
  String language;
  String countryCode;
  bool isLoggedIn;
  String avatar;

  UserDBEntity(
      {this.id,
      this.token,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.isCurrent,
      this.countryCode,
      this.dob,
      this.isLoggedIn: false,
      this.avatar,
      this.language});

  @override
  transform() {
    return User(
        id: id,
        token: token,
        firstName: firstName,
        lastName: lastName,
        email: email,
        mobile: mobile,
        isCurrent: isCurrent,
        countryCode: countryCode,
        dob: dob,
        isLoggedIn: isLoggedIn,
        avatar: avatar,
        locale: userLocale(language));
  }

  @override
  UserDBEntity restore(User data) {
    this.id = data.id;
    this.token = data.token;
    this.firstName = data.firstName;
    this.lastName = data.lastName;
    this.mobile = data.mobile;
    this.email = data.email;
    this.isCurrent = data.isCurrent;
    this.countryCode = data.countryCode;
    this.dob = data.dob;
    this.language = data.locale.toString();
    this.isLoggedIn = data.isLoggedIn;
    this.avatar = data.avatar;
    return this;
  }

  LanguageEnum userLocale(String locale) {
    if (locale == LanguageEnum.ARABIC.toString()) {
      return LanguageEnum.ARABIC;
    } else if (locale == LanguageEnum.ENGLISH.toString()) {
      return LanguageEnum.ENGLISH;
    } else {
      return LanguageEnum.NONE;
    }
  }
}
