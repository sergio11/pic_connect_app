import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindFollowersByUserUseCase extends BaseUseCase<List<UserBO>, FindFollowersByUserParams> {
  final UserRepository userRepository;

  FindFollowersByUserUseCase({ required this.userRepository });

  @override
  Future<Either<Failure, List<UserBO>>> call(FindFollowersByUserParams param) async {
    return await userRepository.findAllFollowersBy(param.uid);
  }
}

class FindFollowersByUserParams extends Equatable {

  final String uid;

  const FindFollowersByUserParams(this.uid);

  @override
  List<Object> get props => [uid];
}
