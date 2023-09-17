import 'package:dartz/dartz.dart';
import 'package:pic_connect/domain/models/failure.dart';
import 'package:pic_connect/domain/models/user.dart';
import 'package:pic_connect/domain/repository/user_repository.dart';

import 'base_use_case.dart';

class FindAllUsersUseCase extends BaseUseCase<List<UserBO>, DefaultParams> {
  final UserRepository userRepository;

  FindAllUsersUseCase({required this.userRepository});

  @override
  Future<Either<Failure, List<UserBO>>> call(DefaultParams param) async {
    return await userRepository.findAll();
  }
}
