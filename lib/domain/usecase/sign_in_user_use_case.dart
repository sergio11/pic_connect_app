import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class SignInUserUseCase extends BaseUseCase<bool, SignInParams>{

  final AuthRepository authRepository;

  SignInUserUseCase({ required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(SignInParams param) async {
    return await authRepository.signInUser(email: param.email, password: param.password);
  }

}

class SignInParams extends Equatable {

  final String email;
  final String password;

  const SignInParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}