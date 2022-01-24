import 'package:data/entity/local/user_db_entity.dart';
import 'package:domain/constants/enum/language_enum.dart';

abstract class UserRemoteDS {}

abstract class UserLocalDS {
  Future<Stream<UserDBEntity>> listenCurrentUser();

  Future<UserDBEntity> getCurrentUser();

  Future<bool> saveCurrentUser(UserDBEntity userDBEntity);

  Future<bool> updateCurrentUser(UserDBEntity userDBEntity);

  Future<bool> removeUser();

  Future<bool> updateLanguage({LanguageEnum locale});
}
