
import 'package:dartz/dartz.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/repository/auth_repository.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class UnFollowUserUseCase extends BaseUseCase<bool, UnFollowUserParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  UnFollowUserUseCase({
    required this.authRepository,
    required this.userRepository
  });


  @override
  Future<Either<Failure, bool>> call(UnFollowUserParams param) async {
    return authRepository.getAuthUserUid().asStream()
        .asyncMap((event) async => await userRepository.followUser(event.getOrElse(() => throw Exception("Auth failed")), param.uid))
        .last;
  }

}

class UnFollowUserParams extends Equatable {

  final String uid;

  const UnFollowUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}