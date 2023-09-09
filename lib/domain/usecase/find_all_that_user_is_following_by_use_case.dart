import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindAllThatUserIsFollowingByUseCase extends BaseUseCase<List<UserBO>, FindAllThatUserIsFollowingByParams> {
  final UserRepository userRepository;

  FindAllThatUserIsFollowingByUseCase({ required this.userRepository });

  @override
  Future<Either<Failure, List<UserBO>>> call(FindAllThatUserIsFollowingByParams param) async {
    return await userRepository.findAllFollowedBy(param.uid);
  }
}

class FindAllThatUserIsFollowingByParams extends Equatable {

  final String uid;

  const FindAllThatUserIsFollowingByParams(this.uid);

  @override
  List<Object> get props => [uid];
}
