// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseEntity _$ErrorResponseEntityFromJson(Map<String, dynamic> json) {
  return ErrorResponseEntity(
    (json['error'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ErrorResponseEntityToJson(
        ErrorResponseEntity instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
