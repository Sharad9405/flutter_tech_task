import 'package:dartz/dartz.dart';
import 'package:domain/error/database_error.dart';
import 'package:domain/model/user/user.dart';

abstract class UserRepository {
  Future<Either<DatabaseError, Stream<User>>> listenCurrentUser();

  /// get current user
  Future<Either<DatabaseError, User>> getCurrentUser();

  Future<Either<DatabaseError, User>> saveUser(User tokenUser);

  Future<Either<DatabaseError, User>> updateUser(User tokenUser);

  Future<Either<DatabaseError, bool>> logoutUser();
}
