import 'dart:typed_data';
import 'package:pic_connect/domain/models/failure.dart';
import '../models/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> getAuthUserUid();

  Future<Either<Failure, UserBO>> getUserDetails({
    required String userUid
  });

  Future<Either<Failure, bool>> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  });

  Future<Either<Failure, bool>> signInUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> signOut();
}
