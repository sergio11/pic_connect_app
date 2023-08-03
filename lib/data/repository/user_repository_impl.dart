import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/utils/mapper.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDatasource userDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;

  UserRepositoryImpl({
    required this.userDatasource,
    required this.userBoMapper
  });

  @override
  Future<Either<Failure, bool>> followUser(String uid, String followId) async {
    try {
      await userDatasource.followUser(uid, followId);
      return const Right(true);
    } catch (ex) {
      debugPrint("followUser - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, UserBO>> findByUid(String uid) async {
     try {
       final user = await userDatasource.findByUid(uid);
       return Right(userBoMapper(user));
     } catch (ex) {
       debugPrint("findByUid - ex -> ${ex.toString()}");
       return Left(Failure(message: ex.toString()));
     }
  }

  @override
  Future<Either<Failure, List<UserBO>>> findByName(String username) async {
    try {
      final userList = await userDatasource.findByName(username);
      return Right(userList.map((e) => userBoMapper(e)).toList());
    } catch (ex) {
      debugPrint("findByName - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserBO>>> findAllThatUserIsFollowingBy(String uid) async {
    try {
      final userList = await userDatasource.findAllThatUserIsFollowingBy(uid);
      return Right(userList.map((e) => userBoMapper(e)).toList());
    } catch (ex) {
      debugPrint("findAllThatUserIsFollowingBy - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserBO>>> findAllFollowersBy(String uid) async {
    try {
      final userList = await userDatasource.findAllFollowersBy(uid);
      return Right(userList.map((e) => userBoMapper(e)).toList());
    } catch (ex) {
      debugPrint("findAllFollowersBy - ex -> ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }
}
