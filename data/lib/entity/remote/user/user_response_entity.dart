import 'package:data/entity/remote/user/user_entity.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_entity.g.dart';

@JsonSerializable()
class UserResponseEntity
    implements BaseLayerDataTransformer<UserResponseEntity, User> {
  @JsonKey(name: 'data')
  final UserEntity userEntity;

  @JsonKey(name: "message")
  final String message;

  UserResponseEntity(this.userEntity, this.message);

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$UserResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseEntityToJson(this);

  @override
  UserResponseEntity restore(User data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  User transform() {
    return this.userEntity.transform();
  }
}
