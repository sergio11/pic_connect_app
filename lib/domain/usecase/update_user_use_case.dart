import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class UpdateUserUseCase extends BaseUseCase<UserBO, UpdateUserParams> {
  final UserRepository userRepository;

  UpdateUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserBO>> call(UpdateUserParams param) async {
    return await userRepository.update(
        uid: param.uid,
        username: param.username,
        email: param.email,
        file: param.file,
        bio: param.bio,
        country: param.country,
        birthDate: param.birthDate
    );
  }
}

class UpdateUserParams extends Equatable {
  String uid;
  String username;
  String email;
  Uint8List? file;
  String? bio;
  String? country;
  String? birthDate;

  UpdateUserParams({
    required this.uid,
    required this.username,
    required this.email,
    this.file,
    this.bio,
    this.country,
    this.birthDate,
  });

  @override
  List<Object> get props => [uid, username, username, email];
}
