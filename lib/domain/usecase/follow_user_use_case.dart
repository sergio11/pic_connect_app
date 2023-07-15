import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/respository/auth_repository.dart';
import 'package:pic_connect/domain/respository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FollowUserUseCase extends BaseUseCase<bool, FollowUserParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  FollowUserUseCase({
    required this.authRepository,
    required this.userRepository
  });


  @override
  Future<Either<Failure, bool>> call(FollowUserParams param) async {
    return authRepository.getAuthUserUid().asStream()
        .asyncMap((event) async => await userRepository.followUser(event.getOrElse(() => throw Exception("Auth failed")), param.uid))
        .last;
  }

}

class FollowUserParams extends Equatable {

  final String uid;

  const FollowUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}