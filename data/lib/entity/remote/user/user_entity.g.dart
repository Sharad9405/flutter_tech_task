// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    token: json['token'] as String,
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    mobile: json['mobile'] as String,
    dob: json['date_of_birth'] as String,
    countryCode: json['country_code'] as String,
    avatar: json['avatar'] as String,
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'date_of_birth': instance.dob,
      'country_code': instance.countryCode,
      'avatar': instance.avatar,
    };
