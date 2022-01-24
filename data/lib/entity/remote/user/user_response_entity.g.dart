// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseEntity _$UserResponseEntityFromJson(Map<String, dynamic> json) {
  return UserResponseEntity(
    json['data'] == null
        ? null
        : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
    json['message'] as String,
  );
}

Map<String, dynamic> _$UserResponseEntityToJson(UserResponseEntity instance) =>
    <String, dynamic>{
      'data': instance.userEntity,
      'message': instance.message,
    };
