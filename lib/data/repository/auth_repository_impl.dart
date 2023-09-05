import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:pic_connect/data/datasource/auth_datasource.dart';
import 'package:pic_connect/data/datasource/dto/save_user_dto.dart';
import 'package:pic_connect/data/datasource/dto/user_dto.dart';
import 'package:pic_connect/data/datasource/storage_datasource.dart';
import 'package:pic_connect/data/datasource/user_datasource.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/utils/mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;
  final UserDatasource userDatasource;
  final StorageDatasource storageDatasource;
  final Mapper<UserDTO, UserBO> userBoMapper;

  AuthRepositoryImpl(
      {required this.authDatasource,
      required this.userDatasource,
      required this.storageDatasource,
      required this.userBoMapper});

  @override
  Future<Either<Failure, UserBO>> getUserDetails(
      {required String userUid}) async {
    try {
      final user = await userDatasource.findByUid(userUid);
      return Right(userBoMapper(user));
    } catch (ex) {
      debugPrint("getUserDetails - ex - ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signInUser(
      {required String email, required String password}) async {
    try {
      // logging in user with email and password
      await authDatasource.signInUser(email: email, password: password);
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await authDatasource.signOut();
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signUpUser(
      {required String email,
      required String password,
      required String username,
      required Uint8List file}) async {
    try {
      final userUid =
          await authDatasource.signUpUser(email: email, password: password);
      final userPhotoUrl = await storageDatasource.uploadFileToStorage(
          folderName: 'profilePics', id: userUid, file: file);
      await userDatasource.save(SaveUserDTO(
          uid: userUid,
          username: username,
          email: email,
          photoUrl: userPhotoUrl));
      return const Right(true);
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getAuthUserUid() async {
    try {
      return Right(await authDatasource.getCurrentAuthUserUid());
    } catch (ex) {
      debugPrint("getAuthUserUid - ex - ${ex.toString()}");
      return Left(Failure(message: ex.toString()));
    }
  }
}
