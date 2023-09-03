
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class SignUpUserUseCase extends BaseUseCase<bool, SignUpParams> {

  final AuthRepository authRepository;

  SignUpUserUseCase({ required this.authRepository });

  @override
  Future<Either<Failure, bool>> call(SignUpParams param) async {
    return await authRepository.signUpUser(
        email: param.email,
        password: param.password,
        username: param.username,
        file: param.file
    );
  }

}

class SignUpParams extends Equatable {

  final String email;
  final String password;
  final String username;
  final Uint8List file;

  const SignUpParams(this.email, this.password, this.username, this.file);

  @override
  List<Object> get props => [email, password, username, file];
}