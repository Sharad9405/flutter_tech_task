import 'package:domain/model/user/user.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity implements BaseLayerDataTransformer<UserEntity, User> {
  final String token;
  final int id;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "mobile")
  final String mobile;
  @JsonKey(name: "date_of_birth")
  final String dob;
  @JsonKey(name: "country_code")
  final String countryCode;
  @JsonKey(name: "avatar")
  final String avatar;

  UserEntity(
      {this.token: "",
      this.id: -1,
      this.firstName: "",
      this.lastName: "",
      this.email: "",
      this.mobile: "",
      this.dob: "",
      this.countryCode: "",
      this.avatar: ""});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  UserEntity restore(User user) {
    return UserEntity();
  }

  @override
  User transform() {
    return User(
        token: this.token,
        id: this.id,
        firstName: this.firstName,
        lastName: this.lastName,
        email: this.email,
        mobile: this.mobile,
        dob: this.dob,
        countryCode: this.countryCode,
        isCurrent: true,
        avatar: this.avatar);
  }
}
