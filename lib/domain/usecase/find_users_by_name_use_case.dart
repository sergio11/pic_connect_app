

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';
import 'package:pic_connect/domain/usecase/base_use_case.dart';

class FindUsersByNameUseCase extends BaseUseCase<List<UserBO>, FindUsersByNameParams> {

  final UserRepository userRepository;

  FindUsersByNameUseCase({ required this.userRepository });

  @override
  Future<Either<Failure, List<UserBO>>> call(FindUsersByNameParams param) async {
    return await userRepository.findByName(param.username);
  }
}

class FindUsersByNameParams extends Equatable {

  final String username;

  const FindUsersByNameParams(this.username);

  @override
  List<Object> get props => [username];
}