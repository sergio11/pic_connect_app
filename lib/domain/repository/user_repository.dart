import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> followUser(String uid, String followId);

  Future<Either<Failure, UserBO>> findByUid(String uid);

  Future<Either<Failure, List<UserBO>>> findByName(String username);

  Future<Either<Failure, List<UserBO>>> findAllFollowersBy(String uid);

  Future<Either<Failure, List<UserBO>>> findAllThatUserIsFollowingBy(String uid);
}
