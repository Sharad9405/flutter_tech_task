import 'package:json_annotation/json_annotation.dart';

part 'error_response_entity.g.dart';

@JsonSerializable()
class ErrorResponseEntity {
  List<String> error;

  ErrorResponseEntity(this.error);

  factory ErrorResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$ErrorResponseEntityFromJson(json);
  }
}
